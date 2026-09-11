
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
      #text(fill: rgb("#94a3b8"), size: 11pt, weight: "bold", tracking: 0.15em)[IIT MADRAS BS IN DATA SCIENCE & ELECTRONIC SYSTEMS] \
      #v(10pt)
      #text(fill: white, size: 26pt, weight: "bold")[Deep Learning & Generative AI] \
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
    #text(weight: "bold", size: 12pt, fill: rgb("#0f172a"))[📖 Compendium Table of Contents & Structure] \
    #v(10pt)
    
    #grid(
      columns: (auto, 1fr),
      gutter: 14pt,
      
      [#circle(radius: 12pt, fill: rgb("#1a365d"))[#align(center + horizon)[#text(fill: white, weight: "bold")[01]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#1a365d"))[PyTorch Fundamentals] \
        #text(size: 9pt, fill: rgb("#64748b"))[Tensors, Tensor Attributes, Mathematical Operations, Reshaping, Slicing, Matrix Multiplication, Device Agnostic Execution & CUDA Acceleration.]
      ],
      
      [#circle(radius: 12pt, fill: rgb("#22543d"))[#align(center + horizon)[#text(fill: white, weight: "bold")[02]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#22543d"))[PyTorch Workflow & End-to-End Modeling] \
        #text(size: 9pt, fill: rgb("#64748b"))[Data Ingestion, Custom nn.Module Architecture, Forward Propagation, Loss Computation, Optimizers, Epoch Training Loop, Evaluation & Checkpointing.]
      ],
      
      [#circle(radius: 12pt, fill: rgb("#742a2a"))[#align(center + horizon)[#text(fill: white, weight: "bold")[03]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#742a2a"))[Customer Churn Prediction (ANN Binary Classification)] \
        #text(size: 9pt, fill: rgb("#64748b"))[Tabular Data Wrangling, Feature Scaling, Multi-Layer Perceptron (MLP), Binary Cross-Entropy Loss, Precision-Recall Curves & Production Thresholding.]
      ],
      
      [#circle(radius: 12pt, fill: rgb("#44337a"))[#align(center + horizon)[#text(fill: white, weight: "bold")[04]]]],
      [
        #text(weight: "bold", size: 11pt, fill: rgb("#44337a"))[Fashion MNIST Classification (Multi-Class Vision)] \
        #text(size: 9pt, fill: rgb("#64748b"))[Torchvision Image Datasets, Mini-Batch DataLoader Pipelines, Non-Linear Vision MLPs, Cross-Entropy Loss Optimization & Multi-Class Confusion Matrix Analysis.]
      ]
    )
  ]
)

#v(2cm)

#align(center)[
  #text(size: 9pt, fill: rgb("#94a3b8"))[Document Compiled with LaTeX-Grade Typst Typography • Zero-Loss High-Resolution Image Rendering]
]
