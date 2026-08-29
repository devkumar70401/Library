import os
import json
import base64
import re
import urllib.request
import hashlib
import subprocess
from pypdf import PdfWriter

BASE_DIR = "/home/dev/SE/Library/BS - Deep Learning and Generative AI/Week - 1 & 2"
BUILD_DIR = os.path.join(BASE_DIR, "pdf_build")
IMG_DIR = os.path.join(BUILD_DIR, "images")
OUTPUT_PDF_DIR = os.path.join(BASE_DIR, "PDFs")
os.makedirs(IMG_DIR, exist_ok=True)
os.makedirs(OUTPUT_PDF_DIR, exist_ok=True)

NOTEBOOKS = [
    {
        "id": "01",
        "title": "PyTorch Fundamentals",
        "file": "Pytorch Fundamentals.ipynb",
        "pdf_name": "01_PyTorch_Fundamentals.pdf",
        "theme_color": "rgb(\"1a365d\")", # Deep Navy
        "desc": "Tensors, Tensor Attributes, Mathematical Operations, Reshaping, Slicing, Matrix Multiplication, Device Agnostic Execution & CUDA Acceleration"
    },
    {
        "id": "02",
        "title": "PyTorch Workflow & Modeling",
        "file": "Pytorch Workflow.ipynb",
        "pdf_name": "02_PyTorch_Workflow.pdf",
        "theme_color": "rgb(\"22543d\")", # Forest Green
        "desc": "Data Ingestion, Custom nn.Module Architecture, Forward Propagation, Loss Computation, Optimizers, Training Loop, Evaluation & Checkpointing"
    },
    {
        "id": "03",
        "title": "Customer Churn Prediction (ANN Binary Classification)",
        "file": "Customer Churn Prediction.ipynb",
        "pdf_name": "03_Customer_Churn_Prediction.pdf",
        "theme_color": "rgb(\"742a2a\")", # Deep Maroon
        "desc": "Tabular Data Preprocessing, Standardization, Multi-Layer Perceptron (MLP), BCELoss, Training & Decision Threshold Evaluation"
    },
    {
        "id": "04",
        "title": "Fashion MNIST Classification (Multi-Class Vision)",
        "file": "Fashion MNIST Classification.ipynb",
        "pdf_name": "04_Fashion_MNIST_Classification.pdf",
        "theme_color": "rgb(\"44337a\")", # Deep Purple
        "desc": "Torchvision Datasets, DataLoader Batching, Multi-Class MLP Architecture, CrossEntropyLoss, Accuracy & Confusion Matrices"
    }
]

def download_remote_image(url):
    try:
        url_hash = hashlib.md5(url.encode("utf-8")).hexdigest()[:10]
        ext = ".png"
        if ".jpg" in url.lower() or ".jpeg" in url.lower():
            ext = ".jpg"
        elif ".svg" in url.lower():
            ext = ".svg"
            
        local_name = f"web_{url_hash}{ext}"
        local_path = os.path.join(IMG_DIR, local_name)
        
        if not os.path.exists(local_path):
            print(f"Downloading remote image: {url[:60]}...")
            req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
            with urllib.request.urlopen(req, timeout=10) as resp:
                with open(local_path, "wb") as f:
                    f.write(resp.read())
                    
        return f"images/{local_name}"
    except Exception as e:
        print(f"Warning: could not download image {url}: {e}")
        return None

def markdown_to_typst(md_text):
    if not md_text.strip():
        return ""
        
    # Find all remote image markdown links: ![alt](http...) or <img src="http...">
    urls = re.findall(r'!\[.*?\]\((https?://[^\s\)]+)\)', md_text)
    urls += re.findall(r'<img[^>]+src=["\x27](https?://[^"\x27]+)["\x27]', md_text)
    
    for url in set(urls):
        local_rel_path = download_remote_image(url)
        if local_rel_path:
            md_text = md_text.replace(url, local_rel_path)
            
    cmd = ["/home/dev/.local/bin/pandoc", "-f", "markdown-native_divs-native_spans+tex_math_dollars", "-t", "typst"]
    res = subprocess.run(cmd, input=md_text, capture_output=True, text=True)
    if res.returncode == 0:
        typst_out = res.stdout
        # Also clean up any lingering http image paths in typst
        http_imgs = re.findall(r'#image\("(https?://[^"]+)"\)', typst_out)
        for h_url in set(http_imgs):
            local_rel = download_remote_image(h_url)
            if local_rel:
                typst_out = typst_out.replace(h_url, local_rel)
            else:
                # If cannot download, remove the image block to prevent compiler error
                typst_out = re.sub(r'#figure\(image\("' + re.escape(h_url) + r'"\)[^\)]*\)', '', typst_out)
                typst_out = typst_out.replace(f'#image("{h_url}")', '')
        return typst_out
    else:
        return md_text

def generate_typst_document(nb_info):
    typst_path = os.path.join(BUILD_DIR, f"{nb_info['pdf_name'][:-4]}.typ")
    pdf_path = os.path.join(OUTPUT_PDF_DIR, nb_info["pdf_name"])
    
    nb_path = os.path.join(BASE_DIR, nb_info["file"])
    with open(nb_path, "r", encoding="utf-8") as f:
        nb = json.load(f)
        
    cells = nb.get("cells", [])
    
    header = f"""
#let horizontalrule = [
  #v(4pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e0"))
  #v(4pt)
]

#set page(
  paper: "a4",
  margin: (x: 1.8cm, top: 2.3cm, bottom: 2.3cm),
  header: context {{
    if here().page() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8.5pt, fill: luma(100))[IIT Madras BS • Deep Learning & GenAI]],
        align(right)[#text(size: 8.5pt, fill: {nb_info['theme_color']}, weight: "bold")[{nb_info['title']}]]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.5pt + luma(180))
    ]
  }},
  footer: context {{
    grid(
      columns: (1fr, 1fr),
      align(left)[#text(size: 8.5pt, fill: luma(120))[Week 1 & 2 Course Notebooks]],
      align(right)[#text(size: 8.5pt, fill: luma(100))[Page #here().page()]]
    )
  }}
)

#set text(font: "Liberation Sans", size: 9.5pt, fill: rgb("#1a202c"))
#set par(justify: true, leading: 0.6em)
#set heading(numbering: "1.1")

#align(center)[
  #block(
    fill: {nb_info['theme_color']},
    inset: 16pt,
    radius: 6pt,
    width: 100%,
    [
      #text(fill: white, size: 18pt, weight: "bold")[{nb_info['title']}] \\
      #v(5pt)
      #text(fill: rgb("#e2e8f0"), size: 10.5pt)[IIT Madras BS in Data Science & Electronic Systems] \\
      #v(2pt)
      #text(fill: rgb("#cbd5e0"), size: 9pt, style: "italic")[Course: Deep Learning & Generative AI • Week 1 & 2]
    ]
  )
]

#v(8pt)
#block(
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#e2e8f0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  [
    #text(weight: "bold", size: 10pt, fill: {nb_info['theme_color']})[Notebook Overview & Key Topics Covered:] \\
    #v(3pt)
    #text(size: 9pt, fill: rgb("#4a5568"))[{nb_info['desc']}]
  ]
)

#v(10pt)
"""

    content_blocks = []
    img_idx = 0

    for c_idx, cell in enumerate(cells, 1):
        cell_type = cell.get("cell_type")
        source = "".join(cell.get("source", []))
        
        if not source.strip():
            continue
            
        if cell_type == "markdown":
            typst_md = markdown_to_typst(source)
            content_blocks.append(f"\n{typst_md}\n")
            
        elif cell_type == "code":
            code_block = f"""
#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [{c_idx}]]]
    #v(-6pt)
    ```python
{source}
    ```
  ]
)
"""
            content_blocks.append(code_block)
            
            outputs = cell.get("outputs", [])
            for out in outputs:
                if "text" in out:
                    out_text = "".join(out.get("text", []))
                    if out_text.strip():
                        if len(out_text) > 2000:
                            out_text = out_text[:2000] + "\n... [Output truncated for brevity] ..."
                        out_block = f"""
#block(
  width: 100%,
  stroke: (left: 2.5pt + {nb_info['theme_color']}),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
{out_text.strip()}
    ```
  ]
)
"""
                        content_blocks.append(out_block)
                        
                elif "data" in out:
                    data = out.get("data", {})
                    if "text/plain" in data and "image/png" not in data and "image/jpeg" not in data:
                        text_val = "".join(data.get("text/plain", []))
                        if text_val.strip() and not text_val.startswith("<"):
                            if len(text_val) > 2000:
                                text_val = text_val[:2000] + "\n... [Output truncated for brevity] ..."
                            out_block = f"""
#block(
  width: 100%,
  stroke: (left: 2.5pt + {nb_info['theme_color']}),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
{text_val.strip()}
    ```
  ]
)
"""
                            content_blocks.append(out_block)
                            
                    if "image/png" in data:
                        img_idx += 1
                        img_filename = f"img_{nb_info['id']}_{img_idx}.png"
                        img_path = os.path.join(IMG_DIR, img_filename)
                        with open(img_path, "wb") as f_img:
                            f_img.write(base64.b64decode(data["image/png"]))
                        img_block = f"""
#align(center)[
  #v(4pt)
  #image("images/{img_filename}", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell {c_idx}]
  #v(4pt)
]
"""
                        content_blocks.append(img_block)
                        
                    elif "image/jpeg" in data:
                        img_idx += 1
                        img_filename = f"img_{nb_info['id']}_{img_idx}.jpg"
                        img_path = os.path.join(IMG_DIR, img_filename)
                        with open(img_path, "wb") as f_img:
                            f_img.write(base64.b64decode(data["image/jpeg"]))
                        img_block = f"""
#align(center)[
  #v(4pt)
  #image("images/{img_filename}", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output image generated from Cell {c_idx}]
  #v(4pt)
]
"""
                        content_blocks.append(img_block)

    full_typst = header + "\n".join(content_blocks)
    
    with open(typst_path, "w", encoding="utf-8") as f:
        f.write(full_typst)
        
    print(f"Generated Typst source: {typst_path} ({len(full_typst)} bytes, {img_idx} images)")
    
    cmd = ["/home/dev/.local/bin/typst", "compile", typst_path, pdf_path]
    print(f"Compiling {nb_info['pdf_name']} with Typst...")
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode == 0:
        print(f"✅ Successfully compiled: {pdf_path}")
        return pdf_path
    else:
        print(f"❌ Error compiling {typst_path}:\n{res.stderr}")
        return None

def build_cover_page():
    cover_typst_path = os.path.join(BUILD_DIR, "00_Cover_and_TOC.typ")
    cover_pdf_path = os.path.join(BUILD_DIR, "00_Cover_and_TOC.pdf")
    
    cover_content = """
#set page(
  paper: "a4",
  margin: (x: 2.2cm, top: 2.8cm, bottom: 2.5cm),
  header: none,
  footer: none
)

#set text(font: "Liberation Sans", size: 10pt, fill: rgb("#1a202c"))
#set par(justify: true, leading: 0.7em)

#v(2cm)

#align(center)[
  #block(
    fill: rgb("#0f172a"),
    inset: (x: 20pt, y: 30pt),
    radius: 8pt,
    width: 100%,
    [
      #text(fill: rgb("#94a3b8"), size: 11pt, weight: "bold", tracking: 0.15em)[IIT MADRAS BS IN DATA SCIENCE & ELECTRONIC SYSTEMS] \\
      #v(10pt)
      #text(fill: white, size: 26pt, weight: "bold")[Deep Learning & Generative AI] \\
      #v(8pt)
      #text(fill: rgb("#38bdf8"), size: 15pt, weight: "medium")[Weeks 1 & 2 • Complete Practical Compendium]
    ]
  )
]

#v(1.5cm)

#block(
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#e2e8f0"),
  inset: 16pt,
  radius: 6pt,
  width: 100%,
  [
    #text(weight: "bold", size: 12pt, fill: rgb("#0f172a"))[📖 Compendium Table of Contents & Structure] \\
    #v(10pt)
    
    #grid(
      columns: (auto, 1fr),
      gutter: 14pt,
      
      [#circle(radius: 12pt, fill: rgb("#1a365d"))[#align(center + horizon)[#text(fill: white, weight: "bold")[01]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#1a365d"))[PyTorch Fundamentals] \\
        #text(size: 9pt, fill: rgb("#64748b"))[Tensors, Tensor Attributes, Mathematical Operations, Reshaping, Slicing, Matrix Multiplication, Device Agnostic Execution & CUDA Acceleration.]
      ],
      
      [#circle(radius: 12pt, fill: rgb("#22543d"))[#align(center + horizon)[#text(fill: white, weight: "bold")[02]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#22543d"))[PyTorch Workflow & End-to-End Modeling] \\
        #text(size: 9pt, fill: rgb("#64748b"))[Data Ingestion, Custom nn.Module Architecture, Forward Propagation, Loss Computation, Optimizers, Epoch Training Loop, Evaluation & Checkpointing.]
      ],
      
      [#circle(radius: 12pt, fill: rgb("#742a2a"))[#align(center + horizon)[#text(fill: white, weight: "bold")[03]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#742a2a"))[Customer Churn Prediction (ANN Binary Classification)] \\
        #text(size: 9pt, fill: rgb("#64748b"))[Tabular Data Wrangling, Feature Scaling, Multi-Layer Perceptron (MLP), Binary Cross-Entropy Loss, Precision-Recall Curves & Production Thresholding.]
      ],
      
      [#circle(radius: 12pt, fill: rgb("#44337a"))[#align(center + horizon)[#text(fill: white, weight: "bold")[04]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#44337a"))[Fashion MNIST Classification (Multi-Class Vision)] \\
        #text(size: 9pt, fill: rgb("#64748b"))[Torchvision Image Datasets, Mini-Batch DataLoader Pipelines, Non-Linear Vision MLPs, Cross-Entropy Loss Optimization & Multi-Class Confusion Matrix Analysis.]
      ]
    )
  ]
)

#v(2cm)

#align(center)[
  #text(size: 9pt, fill: rgb("#94a3b8"))[Document Compiled with LaTeX-Grade Typst Typography • Zero-Loss High-Resolution Image Rendering]
]
"""
    with open(cover_typst_path, "w", encoding="utf-8") as f:
        f.write(cover_content)
        
    cmd = ["/home/dev/.local/bin/typst", "compile", cover_typst_path, cover_pdf_path]
    subprocess.run(cmd, capture_output=True, text=True)
    return cover_pdf_path

def build_combined_pdf(cover_pdf, individual_pdfs):
    combined_pdf_path = os.path.join(OUTPUT_PDF_DIR, "Week_01_and_02_PyTorch_Mastery_Complete_Compendium.pdf")
    merger = PdfWriter()
    
    if cover_pdf and os.path.exists(cover_pdf):
        print(f"Adding Cover & TOC: {os.path.basename(cover_pdf)}")
        merger.append(cover_pdf)
        
    for pdf in individual_pdfs:
        if pdf and os.path.exists(pdf):
            print(f"Adding to Master PDF: {os.path.basename(pdf)}")
            merger.append(pdf)
            
    with open(combined_pdf_path, "wb") as f_out:
        merger.write(f_out)
        
    print(f"🎉 Master Combined PDF created at: {combined_pdf_path}")
    return combined_pdf_path

print("Starting PDF generation pipeline...")
pdf_results = []
for nb in NOTEBOOKS:
    pdf_path = generate_typst_document(nb)
    pdf_results.append(pdf_path)

cover_pdf = build_cover_page()
build_combined_pdf(cover_pdf, pdf_results)
