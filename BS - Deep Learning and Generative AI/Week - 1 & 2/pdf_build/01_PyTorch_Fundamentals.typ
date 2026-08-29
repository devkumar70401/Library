
#let horizontalrule = [
  #v(4pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e0"))
  #v(4pt)
]

#set page(
  paper: "a4",
  margin: (x: 1.8cm, top: 2.3cm, bottom: 2.3cm),
  header: context {
    if here().page() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8.5pt, fill: luma(100))[IIT Madras BS • Deep Learning & GenAI]],
        align(right)[#text(size: 8.5pt, fill: rgb("1a365d"), weight: "bold")[PyTorch Fundamentals]]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.5pt + luma(180))
    ]
  },
  footer: context {
    grid(
      columns: (1fr, 1fr),
      align(left)[#text(size: 8.5pt, fill: luma(120))[Week 1 & 2 Course Notebooks]],
      align(right)[#text(size: 8.5pt, fill: luma(100))[Page #here().page()]]
    )
  }
)

#set text(font: "Liberation Sans", size: 9.5pt, fill: rgb("#1a202c"))
#set par(justify: true, leading: 0.6em)
#set heading(numbering: "1.1")

#align(center)[
  #block(
    fill: rgb("1a365d"),
    inset: 16pt,
    radius: 6pt,
    width: 100%,
    [
      #text(fill: white, size: 18pt, weight: "bold")[PyTorch Fundamentals] \
      #v(5pt)
      #text(fill: rgb("#e2e8f0"), size: 10.5pt)[IIT Madras BS in Data Science & Electronic Systems] \
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
    #text(weight: "bold", size: 10pt, fill: rgb("1a365d"))[Notebook Overview & Key Topics Covered:] \
    #v(3pt)
    #text(size: 9pt, fill: rgb("#4a5568"))[Tensors, Tensor Attributes, Mathematical Operations, Reshaping, Slicing, Matrix Multiplication, Device Agnostic Execution & CUDA Acceleration]
  ]
)

#v(10pt)

= #strong[PyTorch Fundamentals: A Comprehensive Introduction to Tensor Operations and Deep Learning Foundations]
<pytorch-fundamentals-a-comprehensive-introduction-to-tensor-operations-and-deep-learning-foundations>
#strong[Course:] \[Course Name/Code\] \
#strong[Institution:] IIT Madras \
#strong[Author:] Prof.~Ganapathy Krishnamurthi \
#strong[Date:] \[Date\]

#horizontalrule

== #strong[Learning Objectives]
<learning-objectives>
By the end of this tutorial, students will be able to:

+ #strong[Understand] the fundamental concepts of tensors and their role
  in deep learning
+ #strong[Create] and manipulate tensors using PyTorch’s tensor
  operations
+ #strong[Apply] tensor operations for mathematical computations in deep
  learning contexts
+ #strong[Implement] tensor reshaping, indexing, and aggregation
  operations
+ #strong[Utilize] GPU acceleration for tensor computations
+ #strong[Debug] common tensor-related errors in PyTorch applications

#horizontalrule

== #strong[Prerequisites]
<prerequisites>
- Basic understanding of Python programming
- Familiarity with NumPy arrays (recommended)
- Linear algebra fundamentals (vectors, matrices, matrix multiplication)
- Basic machine learning concepts (recommended but not required)



== #strong[\1. Overview and Theoretical Background]
<overview-and-theoretical-background>



=== #strong[1.1 Introduction to PyTorch]
<introduction-to-pytorch>
#link("https://pytorch.org/")[PyTorch] is an open-source machine
learning framework developed by Facebook’s AI Research lab (FAIR). It
provides a Python-based scientific computing package that serves as:

+ #strong[A replacement for NumPy] with the power of Graphics Processing
  Units (GPUs)
+ #strong[A deep learning research platform] that provides maximum
  flexibility and speed

=== #strong[1.2 Applications and Use Cases]
<applications-and-use-cases>
PyTorch enables researchers and practitioners to:

- #strong[Data Manipulation];: Process and transform multidimensional
  data structures efficiently
- #strong[Algorithm Development];: Implement machine learning and deep
  learning algorithms using automatic differentiation
- #strong[Model Prototyping];: Rapidly develop and test neural network
  architectures
- #strong[Production Deployment];: Scale models from research to
  production environments

=== #strong[1.3 Industry Adoption]
<industry-adoption>
PyTorch has gained significant adoption across various sectors:

- #strong[Technology Companies];: Meta (Facebook), Tesla, Microsoft, and
  others utilize PyTorch for production systems
- #strong[Research Institutions];:
  #link("https://openai.com/blog/openai-pytorch/")[OpenAI] and academic
  institutions leverage PyTorch for cutting-edge research
- #strong[Academic Community];: As of 2022, PyTorch is the
  #link("https://paperswithcode.com/trends")[most utilized deep learning framework]
  in academic publications according to Papers With Code

=== #strong[1.4 Advantages of PyTorch]
<advantages-of-pytorch>
#strong[Research-Friendly Design];: - Dynamic computational graphs allow
for flexible model architectures - Pythonic interface that integrates
seamlessly with the Python ecosystem - Extensive debugging capabilities
with standard Python debugging tools

#strong[Performance Optimization];: - Efficient GPU utilization through
CUDA integration - Optimized tensor operations for numerical
computations - Support for distributed training across multiple devices



=== #strong[1.5 Theoretical Foundation: Understanding Tensors]
<theoretical-foundation-understanding-tensors>
#strong[Tensors] represent the fundamental data structure in machine
learning and deep learning applications. They serve as generalized
mathematical objects that can represent:

- #strong[Scalars] (0-dimensional tensors): Single numerical values
- #strong[Vectors] (1-dimensional tensors): Arrays of numbers with
  directional properties
- #strong[Matrices] (2-dimensional tensors): Rectangular arrays for
  linear transformations
- #strong[Higher-order tensors] (n-dimensional): Multi-dimensional data
  structures for complex data

=== #strong[1.6 Curriculum Structure]
<curriculum-structure>
This tutorial systematically covers the essential tensor operations
required for deep learning applications:

#figure(
  align(center)[#table(
    columns: (19.67%, 36.07%, 44.26%),
    align: (auto,auto,auto,),
    table.header([#strong[Module];], [#strong[Learning
      Outcomes];], [#strong[Practical Applications];],),
    table.hline(),
    [#strong[\2. Tensor Introduction];], [Understand tensor mathematics
    and data representation], [Foundation for all ML/DL operations],
    [#strong[\3. Tensor Creation];], [Master various tensor
    initialization methods], [Data preprocessing and model
    initialization],
    [#strong[\4. Tensor Introspection];], [Extract metadata and
    properties from tensors], [Debugging and model analysis],
    [#strong[\5. Tensor Operations];], [Perform mathematical operations
    on tensors], [Forward and backward propagation in neural networks],
    [#strong[\6. Shape Manipulation];], [Reshape and reorganize tensor
    dimensions], [Data preprocessing and model compatibility],
    [#strong[\7. Tensor Indexing];], [Access and modify specific tensor
    elements], [Data sampling and feature extraction],
    [#strong[\8. NumPy Integration];], [Convert between PyTorch tensors
    and NumPy arrays], [Interoperability with existing data science
    workflows],
    [#strong[\9. Reproducibility];], [Control randomness for consistent
    results], [Ensuring reproducible research and debugging],
    [#strong[\10. GPU Acceleration];], [Leverage GPU computing for
    faster operations], [Scaling computations for large datasets and
    models],
  )]
  , kind: table
  )

=== #strong[1.7 Mathematical Notation]
<mathematical-notation>
Throughout this tutorial, we will use the following mathematical
conventions:

- #strong[Scalars];: Lowercase italic letters (e.g., #emph[x];,
  #emph[y];, #emph[α];)
- #strong[Vectors];: Lowercase bold letters (e.g., #strong[x];,
  #strong[v];)
- #strong[Matrices];: Uppercase bold letters (e.g., #strong[X];,
  #strong[W];)
- #strong[Tensors];: Uppercase bold letters with tensor rank notation
  (e.g., #strong[𝒳] ∈ ℝᵈ¹ˣᵈ²ˣ…ˣᵈⁿ)



== #strong[\2. Environment Setup and Library Imports]
<environment-setup-and-library-imports>



=== #strong[2.1 Installation Requirements]
<installation-requirements>
#strong[Local Installation Prerequisites:] Before executing code in this
tutorial locally, ensure PyTorch is properly installed following the
#link("https://pytorch.org/get-started/locally/")[official PyTorch installation guide];.
The installation process varies based on your operating system, Python
version, and desired CUDA support.

#strong[Cloud Environment:] For #strong[Google Colab] users, PyTorch and
associated libraries are pre-installed and ready for use.

=== #strong[2.2 Compatibility Notes]
<compatibility-notes>
- #strong[Python Version];: Python 3.7 or higher recommended
- #strong[CUDA Support];: Optional but recommended for GPU acceleration
- #strong[Memory Requirements];: Minimum 4GB RAM for basic operations
- #strong[Dependencies];: NumPy, Matplotlib (for visualization examples)



=== #strong[2.3 Library Import and Version Verification]
<library-import-and-version-verification>
We begin by importing the PyTorch library and verifying the installed
version. This step ensures compatibility and helps with debugging
potential version-specific issues.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [8]]]
    #v(-6pt)
    ```python
# Import the PyTorch library
# PyTorch is the primary library for tensor operations and deep learning
import torch

# Display the PyTorch version
# This is crucial for ensuring compatibility with code examples
# Different PyTorch versions may have slight API differences
print(f"PyTorch Version: {torch.__version__}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
PyTorch Version: 2.4.1+cu121
    ```
  ]
)


== #strong[\3. Introduction to Tensors: Mathematical Foundations]
<introduction-to-tensors-mathematical-foundations>



=== #strong[3.1 Theoretical Background]
<theoretical-background>
#strong[Tensors constitute the fundamental building blocks of machine
learning computations.] In the context of deep learning, tensors serve
as the primary data structure for representing:

- #strong[Input data];: Images, text sequences, audio signals, and
  tabular data
- #strong[Model parameters];: Weights and biases in neural networks
- #strong[Intermediate computations];: Activations and gradients during
  training
- #strong[Output predictions];: Classification probabilities and
  regression values

=== #strong[3.2 Mathematical Definition]
<mathematical-definition>
A tensor #strong[T] of rank #strong[n] (or order #strong[n];) is a
mathematical object with #strong[n] indices, where each index can range
over a specific dimension. Formally:

#strong[T] ∈ ℝᵈ¹ˣᵈ²ˣ…ˣᵈⁿ

Where: - #strong[d₁, d₂, …, dₙ] represent the size of each dimension -
#strong[n] is the rank/order of the tensor - #strong[ℝ] denotes the set
of real numbers (though tensors can contain other data types)

=== #strong[3.3 Computational Significance]
<computational-significance>
Tensors enable efficient computation through:

+ #strong[Vectorization];: Operations on entire arrays rather than
  individual elements
+ #strong[Parallelization];: GPU acceleration for simultaneous
  computations
+ #strong[Automatic Differentiation];: Gradient computation for
  optimization algorithms
+ #strong[Memory Efficiency];: Optimized storage and access patterns



=== #strong[3.4 Data Representation Through Tensors]
<data-representation-through-tensors>
#strong[Tensors provide a unified mathematical framework for
representing diverse data types in numerical form.] This numerical
representation is essential because machine learning algorithms operate
exclusively on numerical data.

==== #strong[3.4.1 Image Representation Example]
<image-representation-example>
Consider a color image representation as a 3-dimensional tensor with
shape `[channels, height, width]`:

- #strong[Channels (C)];: Color information (typically 3 for RGB: Red,
  Green, Blue)
- #strong[Height (H)];: Vertical resolution in pixels \
- #strong[Width (W)];: Horizontal resolution in pixels

For example, a standard image might have shape `[3, 224, 224]`,
representing: - #strong[3 color channels] (RGB) - #strong[224 pixels] in
height - #strong[224 pixels] in width - #strong[Total elements];: 3 ×
224 × 224 = 150,528 numerical values

#figure(image("images/web_c1e6276fd8.png"),
  caption: [
    Tensor representation of an image showing the breakdown into color
    channels and spatial dimensions
  ]
)

#emph[Figure 3.1: Transformation of visual data into tensor
representation for computational processing.] #emph[Source:
learnpytorch.io]

==== #strong[3.4.2 Data Type Implications]
<data-type-implications>
The choice of tensor dimensions and data organization significantly
impacts: - #strong[Memory consumption];: Higher dimensions require more
storage - #strong[Computational complexity];: More dimensions increase
operation costs - #strong[Model architecture design];: Network layers
must match tensor shapes - #strong[Training efficiency];: Optimal batch
sizes depend on tensor dimensions



== #strong[\4. Tensor Creation and Initialization Methods]
<tensor-creation-and-initialization-methods>



=== #strong[4.1 Theoretical Framework]
<theoretical-framework>
The
#link("https://pytorch.org/docs/stable/tensors.html")[`torch.Tensor`]
class serves as the fundamental data structure in PyTorch. Understanding
tensor creation methods is crucial for:

- #strong[Data preprocessing];: Converting raw data into tensor format
- #strong[Model initialization];: Creating parameter tensors with
  appropriate shapes
- #strong[Experimentation];: Generating synthetic data for testing and
  validation

=== #strong[4.2 Tensor Hierarchy and Classification]
<tensor-hierarchy-and-classification>
#strong[4.2.1 Scalar Tensors (Rank 0)]

A #strong[scalar] represents a single numerical value and constitutes a
#strong[zero-dimensional tensor];. In mathematical notation: -
#strong[Mathematical representation];: #emph[s] ∈ ℝ - #strong[PyTorch
shape];: `torch.Size([])` - #strong[Dimensions];: 0

#strong[Properties:] - Contains exactly one element - No directional
information - Often used for loss values, learning rates, and single
metrics



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [14]]]
    #v(-6pt)
    ```python
# Create a scalar tensor (0-dimensional tensor)
# Scalars contain a single numerical value and have no dimensions
# They are fundamental building blocks for more complex tensor operations

scalar = torch.tensor(7)  # Create a scalar tensor with value 7

# Display the scalar tensor
print(f"Scalar tensor: {scalar}")
print(f"Scalar value: {scalar.item()}")  # Extract the Python number
print(f"Data type: {scalar.dtype}")       # Check the data type
print(f"Shape: {scalar.shape}")           # Shape is empty for scalars
print(f"Size: {scalar.size()}")           # Alternative way to check shape

# The scalar tensor object contains metadata beyond just the value:
# - dtype: The data type (default is inferred from input)
# - device: The computational device (CPU or GPU)
# - requires_grad: Whether to track gradients for automatic differentiation

scalar
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Scalar tensor: 7
Scalar value: 7
Data type: torch.int64
Shape: torch.Size([])
Size: torch.Size([])
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor(7)
    ```
  ]
)


=== #strong[4.3 Tensor Dimensionality Analysis]
<tensor-dimensionality-analysis>
#strong[Tensor dimensionality] (or rank) indicates the number of indices
required to specify an element within the tensor. The `ndim` attribute
provides this crucial information for tensor manipulation and debugging.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [16]]]
    #v(-6pt)
    ```python
# Check the number of dimensions (rank) of the scalar tensor
# For a scalar, this should return 0 since it has no dimensions
dimensionality = scalar.ndim

print(f"Number of dimensions (rank): {dimensionality}")
print(f"Verification: A scalar has {dimensionality} dimensions")

# Understanding dimensionality is crucial for:
# 1. Matrix operations (shapes must be compatible)
# 2. Neural network layer design (input/output dimensions must match)
# 3. Data preprocessing (ensuring correct tensor shapes)

dimensionality
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Number of dimensions (rank): 0
Verification: A scalar has 0 dimensions
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
0
    ```
  ]
)


=== #strong[4.4 Value Extraction from Tensors]
<value-extraction-from-tensors>
To retrieve the underlying numerical value from a tensor, PyTorch
provides the `item()` method. This method is essential for:

- #strong[Metric reporting];: Extracting loss values for logging
- #strong[Conditional operations];: Using tensor values in Python
  control structures \
- #strong[Debugging];: Inspecting individual tensor elements

#strong[Important constraint];: The `item()` method only works with
tensors containing exactly one element (single-element tensors).



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [18]]]
    #v(-6pt)
    ```python
# Extract the Python numerical value from a single-element tensor
# The item() method converts a PyTorch tensor to a Python scalar
# This is essential when you need to use tensor values in standard Python operations

python_value = scalar.item()

print(f"Original tensor: {scalar}")
print(f"Extracted Python value: {python_value}")
print(f"Type of tensor: {type(scalar)}")
print(f"Type of extracted value: {type(python_value)}")

# Practical applications of item():
# 1. Loss monitoring: loss_value = loss_tensor.item()
# 2. Metric computation: accuracy = correct_predictions.item() / total_samples
# 3. Conditional logic: if accuracy_tensor.item() > threshold: ...
# 4. Logging: print(f"Epoch {epoch}, Loss: {loss.item():.4f}")

# Note: Attempting item() on multi-element tensors will raise an error
# For multi-element tensors, use indexing to access specific elements first

python_value
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Original tensor: 7
Extracted Python value: 7
Type of tensor: <class 'torch.Tensor'>
Type of extracted value: <class 'int'>
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
7
    ```
  ]
)


=== #strong[4.5 Vector Tensors (Rank 1)]
<vector-tensors-rank-1>
==== #strong[4.5.1 Mathematical Definition]
<mathematical-definition>
A #strong[vector] represents a one-dimensional tensor containing
multiple numerical values arranged in a specific order. In mathematical
notation: - #strong[Mathematical representation];: #strong[v] ∈ ℝⁿ -
#strong[PyTorch shape];: `torch.Size([n])` \
\- #strong[Dimensions];: 1

==== #strong[4.5.2 Properties and Characteristics]
<properties-and-characteristics>
#strong[Vectors possess several important properties:] - #strong[Ordered
sequence];: Elements have specific positions (indices) -
#strong[Directional information];: Can represent direction and magnitude
\- #strong[Flexible representation];: Can encode various types of
information

#strong[Real-world applications:] - #strong[Housing features];:
`[bedrooms, bathrooms, square_feet]` - #strong[Word embeddings];: Dense
representations of words in NLP - #strong[Feature vectors];: Extracted
features from raw data - #strong[Probability distributions];:
Categorical probability outputs



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [20]]]
    #v(-6pt)
    ```python
# Create a vector tensor (1-dimensional tensor)
# Vectors contain multiple values arranged in a single dimension
# They are fundamental for representing sequences, features, and embeddings

vector = torch.tensor([7.0, 7.0])  # Create a vector with two identical elements

print(f"Vector tensor: {vector}")
print(f"Data type: {vector.dtype}")
print(f"Dimension: {vector.dim()}")
print(f"Shape: {vector.shape}")
print(f"Number of elements: {vector.numel()}")  # Total number of elements

# Vector interpretation examples:
# [7, 7] could represent:
# - Coordinates in 2D space (x=7, y=7)
# - Two identical measurements
# - A repeated pattern or signal
# - Feature values for two attributes

# Mathematical properties:
print(f"L2 norm (Euclidean length): {torch.norm(vector).item():.4f}")
print(f"Sum of elements: {torch.sum(vector).item()}")
print(f"Mean of elements: {torch.mean(vector.float()).item():.4f}")

vector
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Vector tensor: tensor([7., 7.])
Data type: torch.float32
Dimension: 1
Shape: torch.Size([2])
Number of elements: 2
L2 norm (Euclidean length): 9.8995
Sum of elements: 14.0
Mean of elements: 7.0000
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([7., 7.])
    ```
  ]
)


=== #strong[4.6 Matrix Tensors (Rank 2)]
<matrix-tensors-rank-2>
#strong[Mathematical Definition:] A #strong[matrix] represents a
two-dimensional tensor organized in rows and columns. In mathematical
notation: - #strong[Mathematical representation];: #strong[M] ∈ ℝᵐˣⁿ -
#strong[PyTorch shape];: `torch.Size([m, n])` - #strong[Dimensions];: 2

#strong[Properties:] - #strong[Rows (m)];: First dimension, representing
horizontal sequences - #strong[Columns (n)];: Second dimension,
representing vertical sequences \
\- #strong[Linear transformations];: Matrices can represent linear
mappings between vector spaces - #strong[Data organization];: Natural
structure for tabular data and 2D relationships



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [22]]]
    #v(-6pt)
    ```python
# Create a matrix tensor (2-dimensional tensor)
# Matrices are fundamental for linear algebra operations in machine learning
# They represent linear transformations, weight matrices, and 2D data structures

MATRIX = torch.tensor([[7.0, 8.0],      # First row: [7, 8]
                       [9.0, 10.0]])    # Second row: [9, 10]

print(f"Matrix tensor:\n{MATRIX}")
print(f"Data type: {MATRIX.dtype}")
print(f"Dimension: {MATRIX.dim()}")  # Should return 2 for a matrix
print(f"Shape: {MATRIX.shape}")  # Returns torch.Size([rows, columns])
print(f"Number of dimensions: {MATRIX.ndim}")
print(f"Total elements: {MATRIX.numel()}")

# Matrix properties and operations:
print(f"\nMatrix properties:")
print(f"Determinant: {torch.det(MATRIX.float()).item():.4f}")  # Requires float type
print(f"Trace (sum of diagonal): {torch.trace(MATRIX).item()}")
print(f"Frobenius norm: {torch.norm(MATRIX).item():.4f}")

# Matrix interpretations:
# - Weight matrix in neural networks (input_features × output_features)
# - Transformation matrix for geometric operations
# - Correlation matrix for feature relationships
# - Adjacency matrix for graph representations

MATRIX
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Matrix tensor:
tensor([[ 7.,  8.],
        [ 9., 10.]])
Data type: torch.float32
Dimension: 2
Shape: torch.Size([2, 2])
Number of dimensions: 2
Total elements: 4

Matrix properties:
Determinant: -2.0000
Trace (sum of diagonal): 17.0
Frobenius norm: 17.1464
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[ 7.,  8.],
        [ 9., 10.]])
    ```
  ]
)


=== #strong[4.7 Higher-Order Tensors (Rank ≥ 3)]
<higher-order-tensors-rank-3>
#strong[Mathematical Definition:] Higher-order tensors extend beyond
matrices to represent multi-dimensional data structures. For a rank-3
tensor: - #strong[Mathematical representation];: #strong[𝒯] ∈ ℝᵈ¹ˣᵈ²ˣᵈ³
\- #strong[PyTorch shape];: `torch.Size([d1, d2, d3])` -
#strong[Dimensions];: 3 or higher

#strong[Applications in Deep Learning:] - #strong[Batch processing];:
`[batch_size, features]` or `[batch_size, channels, height, width]` -
#strong[Sequence modeling];:
`[batch_size, sequence_length, feature_dimension]` - #strong[Computer
vision];: `[batch_size, channels, height, width]` for image batches -
#strong[Video processing];:
`[batch_size, time_steps, channels, height, width]`



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [24]]]
    #v(-6pt)
    ```python
# Create a higher-order tensor (3-dimensional tensor)
# This example creates a rank-3 tensor with shape [1, 3, 3]
# The triple bracket notation [[[...]]] indicates three dimensions

TENSOR = torch.tensor([[[1, 2, 3],     # First 3x3 matrix, row 1
                        [3, 6, 9],     # First 3x3 matrix, row 2
                        [2, 4, 5]]])   # First 3x3 matrix, row 3

print(f"3D Tensor:\n{TENSOR}")
print(f"Data type: {TENSOR.dtype}")
print(f"Dimension: {TENSOR.dim()}")  # Should return 3 for a 3D tensor
print(f"Shape: {TENSOR.shape}")  # torch.Size([1, 3, 3])
print(f"Number of dimensions: {TENSOR.ndim}")
print(f"Total elements: {TENSOR.numel()}")

# Shape interpretation: [1, 3, 3]
# - Dimension 0: 1 "slice" or "channel" (outermost dimension)
# - Dimension 1: 3 rows within each slice
# - Dimension 2: 3 columns within each row

print(f"\nDimensional analysis:")
print(f"Outer dimension (axis 0): {TENSOR.shape[0]} - Number of 3x3 matrices")
print(f"Middle dimension (axis 1): {TENSOR.shape[1]} - Number of rows per matrix")
print(f"Inner dimension (axis 2): {TENSOR.shape[2]} - Number of columns per row")

# Real-world analogy: This could represent:
# - A single grayscale image patch (1 channel, 3x3 pixels)
# - One time step of a 3x3 feature map in a CNN
# - A small kernel/filter in convolutional operations
# - A single sample in a batch of 3x3 matrices

TENSOR
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
3D Tensor:
tensor([[[1, 2, 3],
         [3, 6, 9],
         [2, 4, 5]]])
Data type: torch.int64
Dimension: 3
Shape: torch.Size([1, 3, 3])
Number of dimensions: 3
Total elements: 9

Dimensional analysis:
Outer dimension (axis 0): 1 - Number of 3x3 matrices
Middle dimension (axis 1): 3 - Number of rows per matrix
Inner dimension (axis 2): 3 - Number of columns per row
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[[1, 2, 3],
         [3, 6, 9],
         [2, 4, 5]]])
    ```
  ]
)


Alright, it outputs `torch.Size([1, 3, 3])`.

The dimensions go outer to inner.

That means there’s 1 dimension of 3 by 3.

#box(image("images/web_7ebcecf470.png")) Source: learnpytorch.io



The one we just created could be the sales numbers for a steak and
almond butter store.

#figure(image("images/web_669676bdd2.png"),
  caption: [
    a simple tensor in google sheets showing day of week, steak sales
    and almond butter sales
  ]
)

Source: learnpytorch.io



#strong[Note:] You might’ve noticed the usage of lowercase letters for
`scalar` and `vector` and uppercase letters for `MATRIX` and `TENSOR`.
This was on purpose. In practice, you’ll often see scalars and vectors
denoted as lowercase letters such as `y` or `a`. And matrices and
tensors denoted as uppercase letters such as `X` or `W`.

You also might notice the names matrix and tensor used interchangeably.
This is common. Since in PyTorch you’re often dealing with
`torch.Tensor`s (hence the tensor name), however, the shape and
dimensions of what’s inside will dictate what it actually is.



=== #strong[Summary]
<summary>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Name], [What is it?], [Number of dimensions], [Lower
      or upper (usually/example)],),
    table.hline(),
    [#strong[scalar];], [a single number], [0], [Lower (`a`)],
    [#strong[vector];], [a number with direction (e.g.~wind speed with
    direction) but can also have many other numbers], [1], [Lower
    (`y`)],
    [#strong[matrix];], [a 2-dimensional array of numbers], [2], [Upper
    (`Q`)],
    [#strong[tensor];], [an n-dimensional array of numbers], [can be any
    number, a 0-dimension tensor is a scalar, a 1-dimension tensor is a
    vector], [Upper (`X`)],
  )]
  , kind: table
  )



== #strong[\5. Specialized Tensor Initialization Methods]
<specialized-tensor-initialization-methods>



=== #strong[5.1 Zero and One Initialization]
<zero-and-one-initialization>
#strong[Theoretical Background:] Zero and one tensors serve crucial
roles in deep learning applications:

==== #strong[5.1.1 Zero Tensors]
<zero-tensors>
- #strong[Mathematical representation];: #strong[0] ∈ ℝᵈ¹ˣᵈ²ˣ…ˣᵈⁿ where
  all elements equal 0
- #strong[Applications];:
  - #strong[Bias initialization];: Starting with zero bias in neural
    networks
  - #strong[Padding operations];: Adding zero-valued boundaries to
    tensors
  - #strong[Masking];: Creating attention masks or sequence padding
  - #strong[Memory allocation];: Pre-allocating tensors before filling
    with computed values

==== #strong[5.1.2 One Tensors]
<one-tensors>
- #strong[Mathematical representation];: #strong[1] ∈ ℝᵈ¹ˣᵈ²ˣ…ˣᵈⁿ where
  all elements equal 1
- #strong[Applications];:
  - #strong[Identity operations];: Creating identity matrices for linear
    algebra
  - #strong[Normalization];: Serving as multiplicative identity elements
  - #strong[Template creation];: Base tensors for subsequent operations
  - #strong[Testing];: Simplified computations for debugging and
    validation



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [31]]]
    #v(-6pt)
    ```python
# Create a tensor filled with zeros using torch.zeros()
# The size parameter determines the tensor dimensions
# This is essential for initializing tensors before computation

zeros = torch.zeros(size=(3, 4))  # Create a 3x4 matrix of zeros

print(f"Zero tensor:\n{zeros}")
print(f"Shape: {zeros.shape}")
print(f"Data type: {zeros.dtype}")  # Default is torch.float32
print(f"Device: {zeros.device}")    # Default is CPU
print(f"Total elements: {zeros.numel()}")

# Memory and computational considerations:
print(f"\nTensor properties:")
print(f"Memory usage (bytes): {zeros.element_size() * zeros.numel()}")
print(f"Is contiguous in memory: {zeros.is_contiguous()}")
print(f"Requires gradient: {zeros.requires_grad}")

# Common use cases for zero tensors:
# 1. Neural network bias initialization: bias = torch.zeros(output_features)
# 2. Attention masks: mask = torch.zeros(seq_len, seq_len)
# 3. Gradient accumulation: grad_accumulator = torch.zeros_like(parameter)
# 4. Batch processing placeholders: batch_data = torch.zeros(batch_size, features)

# Mathematical verification:
print(f"\nMathematical properties:")
print(f"Sum of all elements: {torch.sum(zeros).item()}")
print(f"Mean of all elements: {torch.mean(zeros).item()}")
print(f"Standard deviation: {torch.std(zeros).item()}")

zeros, zeros.dtype
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Zero tensor:
tensor([[0., 0., 0., 0.],
        [0., 0., 0., 0.],
        [0., 0., 0., 0.]])
Shape: torch.Size([3, 4])
Data type: torch.float32
Device: cpu
Total elements: 12

Tensor properties:
Memory usage (bytes): 48
Is contiguous in memory: True
Requires gradient: False

Mathematical properties:
Sum of all elements: 0.0
Mean of all elements: 0.0
Standard deviation: 0.0
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[0., 0., 0., 0.],
         [0., 0., 0., 0.],
         [0., 0., 0., 0.]]),
 torch.float32)
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [32]]]
    #v(-6pt)
    ```python
# Create a tensor filled with ones using torch.ones()
# Similar to zeros, but all elements are initialized to 1.0
# Useful for multiplicative identity operations and normalization

ones = torch.ones(size=(3, 4))  # Create a 3x4 matrix of ones

print(f"Ones tensor:\n{ones}")
print(f"Shape: {ones.shape}")
print(f"Data type: {ones.dtype}")  # Default is torch.float32
print(f"Device: {ones.device}")

# Mathematical properties of ones tensor:
print(f"\nMathematical analysis:")
print(f"Sum of all elements: {torch.sum(ones).item()}")  # Should equal total elements
print(f"Product of all elements: {torch.prod(ones).item()}")  # Should equal 1.0
print(f"Mean of all elements: {torch.mean(ones).item()}")  # Should equal 1.0
print(f"L2 norm: {torch.norm(ones).item():.4f}")  # Square root of number of elements

# Practical applications:
# 1. Identity matrix creation: I = torch.eye(n) or torch.ones(n,n) with modifications
# 2. Masking operations: valid_mask = torch.ones(sequence_length)
# 3. Weight initialization scaling: weights = torch.ones(shape) * init_scale
# 4. Attention mechanisms: attention_weights = torch.ones(num_heads, seq_len, seq_len)

# Computational efficiency note:
# Both zeros() and ones() are optimized operations that don't require
# element-by-element assignment, making them very fast for large tensors

ones, ones.dtype
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Ones tensor:
tensor([[1., 1., 1., 1.],
        [1., 1., 1., 1.],
        [1., 1., 1., 1.]])
Shape: torch.Size([3, 4])
Data type: torch.float32
Device: cpu

Mathematical analysis:
Sum of all elements: 12.0
Product of all elements: 1.0
Mean of all elements: 1.0
L2 norm: 3.4641
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[1., 1., 1., 1.],
         [1., 1., 1., 1.],
         [1., 1., 1., 1.]]),
 torch.float32)
    ```
  ]
)


=== #strong[5.2 Random Tensor Generation]
<random-tensor-generation>
#strong[Theoretical Foundation:] Random tensors are fundamental in
machine learning for:

+ #strong[Parameter Initialization];: Breaking symmetry in neural
  networks
+ #strong[Stochastic Processes];: Modeling uncertainty and variability \
+ #strong[Data Augmentation];: Creating synthetic training examples
+ #strong[Monte Carlo Methods];: Approximating complex probability
  distributions

==== #strong[5.2.1 Uniform Random Distribution]
<uniform-random-distribution>
The
#link("https://pytorch.org/docs/stable/generated/torch.rand.html")[`torch.rand()`]
function generates tensors with values sampled from a uniform
distribution over the interval \[0, 1):

#strong[Mathematical representation];: X \~ U(0,1) - #strong[Probability
density function];: f(x) = 1 for x ∈ \[0,1), 0 otherwise -
#strong[Mean];: μ = 0.5 - #strong[Variance];: σ² = 1/12 ≈ 0.083



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [34]]]
    #v(-6pt)
    ```python
# Create a tensor with random values from uniform distribution [0, 1)
# Random tensors are crucial for neural network weight initialization
# They help break symmetry and enable effective learning

random_tensor = torch.rand(size=(3, 4))  # 3x4 matrix with random values

print(f"Random tensor:\n{random_tensor}")
print(f"Shape: {random_tensor.shape}")
print(f"Data type: {random_tensor.dtype}")

# Statistical analysis of the random tensor:
print(f"\nStatistical properties:")
print(f"Minimum value: {torch.min(random_tensor).item():.6f}")
print(f"Maximum value: {torch.max(random_tensor).item():.6f}")
print(f"Mean value: {torch.mean(random_tensor).item():.6f}")  # Should be ~0.5
print(f"Standard deviation: {torch.std(random_tensor).item():.6f}")  # Should be ~0.289

# Theoretical vs. empirical comparison:
# For uniform distribution U(0,1): theoretical_mean = 0.5, theoretical_std = 1/√12 ≈ 0.289
theoretical_std = 1.0 / (12**0.5)
print(f"Theoretical std for U(0,1): {theoretical_std:.6f}")

# Applications in deep learning:
# 1. Weight initialization: weights = torch.rand(input_size, output_size) * scale
# 2. Dropout simulation: dropout_mask = (torch.rand(size) > dropout_rate).float()
# 3. Data augmentation: noise = torch.rand(data.shape) * noise_level
# 4. Monte Carlo sampling: samples = torch.rand(num_samples, dimensions)

# Note: Each execution will produce different values due to randomness
# This is essential for stochastic training processes in machine learning

random_tensor, random_tensor.dtype
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Random tensor:
tensor([[0.5607, 0.0444, 0.4183, 0.7015],
        [0.4447, 0.5234, 0.1832, 0.2898],
        [0.5075, 0.8066, 0.1623, 0.8025]])
Shape: torch.Size([3, 4])
Data type: torch.float32

Statistical properties:
Minimum value: 0.044396
Maximum value: 0.806584
Mean value: 0.453747
Standard deviation: 0.248735
Theoretical std for U(0,1): 0.288675
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[0.5607, 0.0444, 0.4183, 0.7015],
         [0.4447, 0.5234, 0.1832, 0.2898],
         [0.5075, 0.8066, 0.1623, 0.8025]]),
 torch.float32)
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [35]]]
    #v(-6pt)
    ```python
# Create a random tensor with image-like dimensions
# Common computer vision tensor shape: (height, width, channels)
# This simulates a standard 224x224 RGB image used in many CV models

random_image_size_tensor = torch.rand(size=(224, 224, 3))

print(f"Image tensor shape: {random_image_size_tensor.shape}")
print(f"Number of dimensions: {random_image_size_tensor.ndim}")
print(f"Total elements: {random_image_size_tensor.numel():,}")  # Format with commas

# Memory analysis for large tensors:
element_size = random_image_size_tensor.element_size()  # Bytes per element
total_memory = random_image_size_tensor.numel() * element_size
print(f"\nMemory analysis:")
print(f"Bytes per element: {element_size}")
print(f"Total memory usage: {total_memory:,} bytes ({total_memory/1024/1024:.2f} MB)")

# Dimension interpretation for computer vision:
height, width, channels = random_image_size_tensor.shape
print(f"\nImage properties:")
print(f"Height: {height} pixels")
print(f"Width: {width} pixels")
print(f"Channels: {channels} (RGB color channels)")
print(f"Total pixels: {height * width:,}")

# Standard image formats in deep learning:
# - ImageNet standard: 224x224x3 (this example)
# - CIFAR-10: 32x32x3
# - MNIST: 28x28x1 (grayscale)
# - High-resolution: 512x512x3 or larger

# Note: In practice, we often use (C, H, W) format for PyTorch models
# This tensor uses (H, W, C) format, which is common for data loading

random_image_size_tensor.shape, random_image_size_tensor.ndim
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Image tensor shape: torch.Size([224, 224, 3])
Number of dimensions: 3
Total elements: 150,528

Memory analysis:
Bytes per element: 4
Total memory usage: 602,112 bytes (0.57 MB)

Image properties:
Height: 224 pixels
Width: 224 pixels
Channels: 3 (RGB color channels)
Total pixels: 50,176
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(torch.Size([224, 224, 3]), 3)
    ```
  ]
)


=== #strong[5.3 Creating a range and tensors like]
<creating-a-range-and-tensors-like>
Sometimes you might want a range of numbers, such as 1 to 10 or 0 to
100.

`torch.arange(start, end, step)`

Where: \* `start` = start of range (e.g.~0) \* `end` = end of range
(e.g.~10) \* `step` = how many steps in between each value (e.g.~1)



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [37]]]
    #v(-6pt)
    ```python
# Create a range of values 0 to 10
zero_to_ten = torch.arange(start=0, end=10, step=1)
zero_to_ten
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    ```
  ]
)


Sometimes you might want one tensor of a certain type with the same
shape as another tensor.

For example, a tensor of all zeros with the same shape as a previous
tensor.

To do so you can use
#link("https://pytorch.org/docs/stable/generated/torch.zeros_like.html")[`torch.zeros_like(input)`]
or
#link("https://pytorch.org/docs/1.9.1/generated/torch.ones_like.html")[`torch.ones_like(input)`]
which return a tensor filled with zeros or ones in the same shape as the
`input` respectively.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [39]]]
    #v(-6pt)
    ```python
# Can also create a tensor of zeros similar to another tensor
ten_zeros = torch.zeros_like(input=zero_to_ten) # will have same shape
ten_zeros
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    ```
  ]
)


=== #strong[5.4 Tensor datatypes]
<tensor-datatypes>
There are many different
#link("https://pytorch.org/docs/stable/tensors.html#data-types")[tensor datatypes available in PyTorch];.



Generally if you see `torch.cuda` anywhere, the tensor is being used for
GPU (since Nvidia GPUs use a computing toolkit called CUDA).

The most common type (and generally the default) is `torch.float32` or
`torch.float`. But there’s also 16-bit floating point (`torch.float16`
or `torch.half`) and 64-bit floating point (`torch.float64` or
`torch.double`). There’s also 8-bit, 16-bit, 32-bit and 64-bit integers.

#strong[Note:] An integer is a flat round number like `7` whereas a
float has a decimal `7.0`.

#strong[Resources:] \* See the
#link("https://pytorch.org/docs/stable/tensors.html#data-types")[PyTorch documentation for a list of all available tensor datatypes];.
\* Read the
#link("https://en.wikipedia.org/wiki/Precision_(computer_science)")[Wikipedia page for an overview of what is precision in computing];.

Let’s see how to create some tensors with specific datatypes. We can do
so using the `dtype` parameter.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [42]]]
    #v(-6pt)
    ```python
# Default datatype for tensors is float32
float_32_tensor = torch.tensor([3.0, 6.0, 9.0],
                               dtype=None, # defaults to None, which is torch.float32 or whatever datatype is passed
                               device=None, # defaults to None, which uses the default tensor type
                               requires_grad=False) # if True, operations performed on the tensor are recorded

float_32_tensor.shape, float_32_tensor.dtype, float_32_tensor.device
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(torch.Size([3]), torch.float32, device(type='cpu'))
    ```
  ]
)


== #strong[6 Manipulating tensors]
<manipulating-tensors>



In deep learning, data (images, text, video, audio, protein structures,
etc) gets represented as tensors.

A model learns by investigating those tensors and performing a series of
operations on tensors to create a representation of the patterns in the
input data.

These operations are often a wonderful dance between: \* Addition \*
Subtraction \* Multiplication (element-wise) \* Division \* Matrix
multiplication



=== #strong[6.1 Basic operations]
<basic-operations>
Let’s start with a few of the fundamental operations, addition (`+`),
subtraction (`-`), mutliplication (`*`).



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [46]]]
    #v(-6pt)
    ```python
# Create a tensor of values and add a number to it
tensor = torch.tensor([1, 2, 3])
tensor + 10
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([11, 12, 13])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [47]]]
    #v(-6pt)
    ```python
# Multiply it by 10
tensor * 10
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([10, 20, 30])
    ```
  ]
)


Let’s subtract a number and this time we’ll reassign the `tensor`
variable.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [49]]]
    #v(-6pt)
    ```python
# Subtract and reassign
tensor = tensor - 10
tensor
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([-9, -8, -7])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [50]]]
    #v(-6pt)
    ```python
# Add and reassign
tensor = tensor + 10
tensor
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3])
    ```
  ]
)


PyTorch also has a bunch of built-in functions like
#link("https://pytorch.org/docs/stable/generated/torch.mul.html#torch.mul")[`torch.mul()`]
(short for multiplication) and
#link("https://pytorch.org/docs/stable/generated/torch.add.html")[`torch.add()`]
to perform basic operations.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [52]]]
    #v(-6pt)
    ```python
# Can also use torch functions
torch.multiply(tensor, 10)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([10, 20, 30])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [53]]]
    #v(-6pt)
    ```python
# Element-wise multiplication (each element multiplies its equivalent, index 0->0, 1->1, 2->2)
print(tensor, "*", tensor)
print("Equals:", tensor * tensor)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3]) * tensor([1, 2, 3])
Equals: tensor([1, 4, 9])
    ```
  ]
)


=== #strong[6.2 Matrix Multiplication: The Foundation of Neural Networks]
<matrix-multiplication-the-foundation-of-neural-networks>
#strong[Theoretical Significance:] Matrix multiplication represents the
most fundamental operation in deep learning. The famous phrase
#emph["Attention is All You Need"] from the Transformer paper could
equally apply to matrix multiplication in neural networks.

==== #strong[6.2.1 Mathematical Definition]
<mathematical-definition>
For matrices #strong[A] ∈ ℝᵐˣⁿ and #strong[B] ∈ ℝⁿˣᵖ, their product
#strong[C] = #strong[AB] ∈ ℝᵐˣᵖ is defined as:

C\[i,j\] = Σₖ₌₁ⁿ A\[i,k\] × B\[k,j\]

==== #strong[6.2.2 Deep Learning Applications]
<deep-learning-applications>
#strong[Neural Network Forward Pass:] - Linear layers: #strong[y] =
#strong[Wx] + #strong[b] - Attention mechanisms:
#strong[Attention];(#strong[Q];,#strong[K];,#strong[V];) =
softmax(#strong[QK];ᵀ/√d)#strong[V] - Convolutional operations:
Implemented as matrix multiplications via im2col

#strong[Training Process:] - Gradient computation: #strong[∂L/∂W]
involves matrix products - Backpropagation: Chain rule applications
through matrix operations



==== #strong[6.2.3 Matrix Multiplication Rules and Implementation]
<matrix-multiplication-rules-and-implementation>
PyTorch implements matrix multiplication through the
#link("https://pytorch.org/docs/stable/generated/torch.matmul.html")[`torch.matmul()`]
function, which handles various tensor dimensions automatically.

#strong[Critical Rules for Matrix Multiplication:]

#strong[Rule 1: Inner Dimension Compatibility] The inner dimensions of
the matrices must match for multiplication to be possible: -
#strong[Valid];: (m, n) \@ (n, p) → (m, p) ✓ - #strong[Invalid];: (m, n)
\@ (k, p) where n ≠ k ✗

#strong[Examples:] - `(3, 2) @ (3, 2)` → #strong[Invalid] (inner
dimensions: 2 ≠ 3) - `(2, 3) @ (3, 2)` → #strong[Valid] (inner
dimensions: 3 = 3) → Result: (2, 2) - `(3, 2) @ (2, 3)` → #strong[Valid]
(inner dimensions: 2 = 2) → Result: (3, 3)

#strong[Rule 2: Output Shape Determination] The resulting matrix has the
shape of the outer dimensions: - (m, #strong[n];) \@ (#strong[n];, p) →
(m, p) - The inner dimensions (#strong[n];) are "consumed" during
multiplication

#strong[Operator Notation:] - #strong[Recommended];:
`torch.matmul(A, B)` or `A @ B` - #strong[Alternative];:
`torch.mm(A, B)` for 2D matrices only - #strong[Note];: The `@` operator
is the standard Python matrix multiplication symbol (PEP 465)

#strong[Computational Complexity:] - #strong[Time complexity];: O(mnp)
for (m,n) \@ (n,p) - #strong[Space complexity];: O(mp) for the result
matrix - #strong[GPU acceleration];: Highly optimized on modern GPUs
using libraries like cuBLAS



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [56]]]
    #v(-6pt)
    ```python
import torch
tensor = torch.tensor([1, 2, 3])
tensor.shape
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
torch.Size([3])
    ```
  ]
)


The difference between element-wise multiplication and matrix
multiplication is the addition of values.

For our `tensor` variable with values `[1, 2, 3]`:

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Operation], [Calculation], [Code],),
    table.hline(),
    [#strong[Element-wise multiplication];], [`[1*1, 2*2, 3*3]` =
    `[1, 4, 9]`], [`tensor * tensor`],
    [#strong[Matrix multiplication];], [`[1*1 + 2*2 + 3*3]` =
    `[14]`], [`tensor.matmul(tensor)`],
  )]
  , kind: table
  )



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [58]]]
    #v(-6pt)
    ```python
# Element-wise matrix multiplication
tensor * tensor
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 4, 9])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [59]]]
    #v(-6pt)
    ```python
# Demonstrate matrix multiplication using torch.matmul()
# This example shows the mathematical difference between element-wise and matrix multiplication

# Using the previously defined tensor: [1, 2, 3]
print(f"Vector tensor: {tensor}")
print(f"Vector shape: {tensor.shape}")

# Matrix multiplication for vectors computes the dot product
# Mathematical formula: v · v = Σᵢ vᵢ × vᵢ = v₁² + v₂² + v₃²
matrix_result = torch.matmul(tensor, tensor)

print(f"\n=== MATRIX MULTIPLICATION (DOT PRODUCT) ===")
print(f"Operation: torch.matmul({tensor}, {tensor})")
print(f"Mathematical computation: (1×1) + (2×2) + (3×3) = 1 + 4 + 9 = 14")
print(f"Result: {matrix_result}")
print(f"Result shape: {matrix_result.shape}")  # Scalar result (0-dimensional)
print(f"Result type: {type(matrix_result.item())} value = {matrix_result.item()}")

# Interpretation in machine learning contexts:
print(f"\n=== MACHINE LEARNING INTERPRETATIONS ===")
print("1. Similarity measure: Higher dot product indicates more similar vectors")
print("2. Energy/norm calculation: ||v||² = v·v (when v=tensor)")
print(f"3. Vector magnitude: ||v|| = √(v·v) = √{matrix_result.item()} = {torch.sqrt(matrix_result).item():.4f}")
print("4. Neural network computation: Linear layer output = input·weights")

# Computational efficiency note:
print(f"\n=== COMPUTATIONAL NOTES ===")
print("Matrix multiplication is highly optimized in PyTorch:")
print("- Uses BLAS (Basic Linear Algebra Subprograms) libraries")
print("- Automatically leverages multiple CPU cores")
print("- GPU acceleration available via cuBLAS on CUDA devices")
print("- Essential operation for neural network forward/backward passes")

matrix_result
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Vector tensor: tensor([1, 2, 3])
Vector shape: torch.Size([3])

=== MATRIX MULTIPLICATION (DOT PRODUCT) ===
Operation: torch.matmul(tensor([1, 2, 3]), tensor([1, 2, 3]))
Mathematical computation: (1×1) + (2×2) + (3×3) = 1 + 4 + 9 = 14
Result: 14
Result shape: torch.Size([])
Result type: <class 'int'> value = 14

=== MACHINE LEARNING INTERPRETATIONS ===
1. Similarity measure: Higher dot product indicates more similar vectors
2. Energy/norm calculation: ||v||² = v·v (when v=tensor)
3. Vector magnitude: ||v|| = √(v·v) = √14 = 3.7417
4. Neural network computation: Linear layer output = input·weights

=== COMPUTATIONAL NOTES ===
Matrix multiplication is highly optimized in PyTorch:
- Uses BLAS (Basic Linear Algebra Subprograms) libraries
- Automatically leverages multiple CPU cores
- GPU acceleration available via cuBLAS on CUDA devices
- Essential operation for neural network forward/backward passes
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor(14)
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [60]]]
    #v(-6pt)
    ```python
# Can also use the "@" symbol for matrix multiplication, though not recommended
tensor @ tensor
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor(14)
    ```
  ]
)


=== #strong[6.3 Aggregation]
<aggregation>



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [62]]]
    #v(-6pt)
    ```python
# Create a tensor
x = torch.arange(0, 100, 10)
x
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [63]]]
    #v(-6pt)
    ```python
print(f"Minimum: {x.min()}")
print(f"Maximum: {x.max()}")
print(f"Sum: {x.sum()}")

    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Minimum: 0
Maximum: 90
Sum: 450
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [64]]]
    #v(-6pt)
    ```python
print(f"Mean: {x.mean()}") # this will give error
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [65]]]
    #v(-6pt)
    ```python
print(f"Mean: {x.type(torch.float32).mean()}") # won't work without float datatype
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Mean: 45.0
    ```
  ]
)


#quote(block: true)[
#strong[Note:] You may find some methods such as `torch.mean()` require
tensors to be in `torch.float32` (the most common) or another specific
datatype, otherwise the operation will fail.
]

You can also do the same as above with `torch` methods.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [67]]]
    #v(-6pt)
    ```python
torch.max(x), torch.min(x), torch.mean(x.type(torch.float32)), torch.sum(x)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor(90), tensor(0), tensor(45.), tensor(450))
    ```
  ]
)


=== #strong[6.4 Positional min/max]
<positional-minmax>
You can also find the index of a tensor where the max or minimum occurs
with
#link("https://pytorch.org/docs/stable/generated/torch.argmax.html")[`torch.argmax()`]
and
#link("https://pytorch.org/docs/stable/generated/torch.argmin.html")[`torch.argmin()`]
respectively.

This is helpful incase you just want the position where the highest (or
lowest) value is and not the actual value itself



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [69]]]
    #v(-6pt)
    ```python
# Create a tensor
tensor = torch.arange(10, 100, 10)
print(f"Tensor: {tensor}")

# Returns index of max and min values
print(f"Index where max value occurs: {tensor.argmax()}")
print(f"Index where min value occurs: {tensor.argmin()}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Tensor: tensor([10, 20, 30, 40, 50, 60, 70, 80, 90])
Index where max value occurs: 8
Index where min value occurs: 0
    ```
  ]
)


=== #strong[6.5 Reshaping, Stacking, Squeezing and Unsqueezing]
<reshaping-stacking-squeezing-and-unsqueezing>
Often times you’ll want to reshape or change the dimensions of your
tensors without actually changing the values inside them.



#figure(
  align(center)[#table(
    columns: (50%, 50%),
    align: (auto,auto,),
    table.header([Method], [One-line description],),
    table.hline(),
    [#link("https://pytorch.org/docs/stable/generated/torch.reshape.html#torch.reshape")[`torch.reshape(input, shape)`];], [Reshapes
    `input` to `shape` (if compatible), can also use
    `torch.Tensor.reshape()`.],
    [#link("https://pytorch.org/docs/stable/generated/torch.Tensor.view.html")[`Tensor.view(shape)`];], [Returns
    a view of the original tensor in a different `shape` but shares the
    same data as the original tensor.],
    [#link("https://pytorch.org/docs/1.9.1/generated/torch.stack.html")[`torch.stack(tensors, dim=0)`];], [Concatenates
    a sequence of `tensors` along a new dimension (`dim`), all `tensors`
    must be same size.],
    [#link("https://pytorch.org/docs/stable/generated/torch.squeeze.html")[`torch.squeeze(input)`];], [Squeezes
    `input` to remove all the dimenions with value `1`.],
    [#link("https://pytorch.org/docs/1.9.1/generated/torch.unsqueeze.html")[`torch.unsqueeze(input, dim)`];], [Returns
    `input` with a dimension value of `1` added at `dim`.],
    [#link("https://pytorch.org/docs/stable/generated/torch.permute.html")[`torch.permute(input, dims)`];], [Returns
    a #emph[view] of the original `input` with its dimensions permuted
    (rearranged) to `dims`.],
  )]
  , kind: table
  )

Why do any of these?

Because deep learning models (neural networks) are all about
manipulating tensors in some way. And because of the rules of matrix
multiplication, if you’ve got shape mismatches, you’ll run into errors.
These methods help you make sure the right elements of your tensors are
mixing with the right elements of other tensors.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [72]]]
    #v(-6pt)
    ```python
# Create a tensor
import torch
x = torch.arange(1., 8.)
x, x.shape
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([1., 2., 3., 4., 5., 6., 7.]), torch.Size([7]))
    ```
  ]
)


Now let’s add an extra dimension with `torch.reshape()`.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [74]]]
    #v(-6pt)
    ```python
# Add an extra dimension
x_reshaped = x.reshape(1, 7)
x_reshaped, x_reshaped.shape
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[1., 2., 3., 4., 5., 6., 7.]]), torch.Size([1, 7]))
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [75]]]
    #v(-6pt)
    ```python
# Change view (keeps same data as original but changes view)
# See more: https://stackoverflow.com/a/54507446/7900723
z = x.view(1, 7)
z, z.shape
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[1., 2., 3., 4., 5., 6., 7.]]), torch.Size([1, 7]))
    ```
  ]
)


Remember though, changing the view of a tensor with `torch.view()`
really only creates a new view of the #emph[same] tensor.

So changing the view changes the original tensor too.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [77]]]
    #v(-6pt)
    ```python
# Changing z changes x
z[:, 0] = 5
z, x
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[5., 2., 3., 4., 5., 6., 7.]]), tensor([5., 2., 3., 4., 5., 6., 7.]))
    ```
  ]
)


If we wanted to stack our new tensor on top of itself five times, we
could do so with `torch.stack()`.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [79]]]
    #v(-6pt)
    ```python
# Stack tensors on top of each other
x_stacked = torch.stack([x, x, x, x], dim=0) # try changing dim to dim=1 and see what happens
x_stacked
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[5., 2., 3., 4., 5., 6., 7.],
        [5., 2., 3., 4., 5., 6., 7.],
        [5., 2., 3., 4., 5., 6., 7.],
        [5., 2., 3., 4., 5., 6., 7.]])
    ```
  ]
)


How about removing all single dimensions from a tensor?

To do so you can use `torch.squeeze()`



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [81]]]
    #v(-6pt)
    ```python
print(f"Previous tensor: {x_reshaped}")
print(f"Previous shape: {x_reshaped.shape}")

# Remove extra dimension from x_reshaped
x_squeezed = x_reshaped.squeeze()
print(f"\nNew tensor: {x_squeezed}")
print(f"New shape: {x_squeezed.shape}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Previous tensor: tensor([[5., 2., 3., 4., 5., 6., 7.]])
Previous shape: torch.Size([1, 7])

New tensor: tensor([5., 2., 3., 4., 5., 6., 7.])
New shape: torch.Size([7])
    ```
  ]
)


And to do the reverse of `torch.squeeze()` you can use
`torch.unsqueeze()` to add a dimension value of 1 at a specific index.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [83]]]
    #v(-6pt)
    ```python
print(f"Previous tensor: {x_squeezed}")
print(f"Previous shape: {x_squeezed.shape}")

## Add an extra dimension with unsqueeze
x_unsqueezed = x_squeezed.unsqueeze(dim=0)
print(f"\nNew tensor: {x_unsqueezed}")
print(f"New shape: {x_unsqueezed.shape}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Previous tensor: tensor([5., 2., 3., 4., 5., 6., 7.])
Previous shape: torch.Size([7])

New tensor: tensor([[5., 2., 3., 4., 5., 6., 7.]])
New shape: torch.Size([1, 7])
    ```
  ]
)


You can also rearrange the order of axes values with
`torch.permute(input, dims)`, where the `input` gets turned into a
#emph[view] with new `dims`.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [85]]]
    #v(-6pt)
    ```python
# Create tensor with specific shape
x_original = torch.rand(size=(224, 224, 3))

# Permute the original tensor to rearrange the axis order
x_permuted = x_original.permute(2, 0, 1) # shifts axis 0->1, 1->2, 2->0

print(f"Previous shape: {x_original.shape}")
print(f"New shape: {x_permuted.shape}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Previous shape: torch.Size([224, 224, 3])
New shape: torch.Size([3, 224, 224])
    ```
  ]
)


#quote(block: true)[
#strong[Note];: Because permuting returns a #emph[view] (shares the same
data as the original), the values in the permuted tensor will be the
same as the original tensor and if you change the values in the view, it
will change the values of the original.
]



=== #strong[6.6 Indexing]
<indexing>



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [88]]]
    #v(-6pt)
    ```python
# Create a tensor
import torch
x = torch.arange(1, 10).reshape(1, 3, 3)
x, x.shape
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]]),
 torch.Size([1, 3, 3]))
    ```
  ]
)


Indexing values goes outer dimension -\> inner dimension (check out the
square brackets).



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [90]]]
    #v(-6pt)
    ```python
# Let's index bracket by bracket
print(f"First square bracket:\n{x[0]}")
print(f"Second square bracket: {x[0][0]}")
print(f"Third square bracket: {x[0][0][0]}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
First square bracket:
tensor([[1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]])
Second square bracket: tensor([1, 2, 3])
Third square bracket: 1
    ```
  ]
)


You can also use `:` to specify "all values in this dimension" and then
use a comma (`,`) to add another dimension.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [92]]]
    #v(-6pt)
    ```python
# Get all values of 0th dimension and the 0 index of 1st dimension
x[:, 0]
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[1, 2, 3]])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [93]]]
    #v(-6pt)
    ```python
# Get all values of 0th & 1st dimensions but only index 1 of 2nd dimension
x[:, :, 1]
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[2, 5, 8]])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [94]]]
    #v(-6pt)
    ```python
# Get all values of the 0 dimension but only the 1 index value of the 1st and 2nd dimension
x[:, 1, 1]
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([5])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [95]]]
    #v(-6pt)
    ```python
# Get index 0 of 0th and 1st dimension and all values of 2nd dimension
x[0, 0, :] # same as x[0][0]
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3])
    ```
  ]
)


== #strong[7 PyTorch tensors & NumPy]
<pytorch-tensors-numpy>



PyTorch has functionality to interact with numpy.

The two main methods you’ll want to use for NumPy to PyTorch (and back
again) are: \*
#link("https://pytorch.org/docs/stable/generated/torch.from_numpy.html")[`torch.from_numpy(ndarray)`]
\- NumPy array -\> PyTorch tensor. \*
#link("https://pytorch.org/docs/stable/generated/torch.Tensor.numpy.html")[`torch.Tensor.numpy()`]
\- PyTorch tensor -\> NumPy array.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [98]]]
    #v(-6pt)
    ```python
# NumPy array to tensor
import torch
import numpy as np
array = np.arange(1.0, 8.0)
tensor = torch.from_numpy(array)
array, tensor
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(array([1., 2., 3., 4., 5., 6., 7.]),
 tensor([1., 2., 3., 4., 5., 6., 7.], dtype=torch.float64))
    ```
  ]
)


#quote(block: true)[
#strong[Note:] By default, NumPy arrays are created with the datatype
`float64` and if you convert it to a PyTorch tensor, it’ll keep the same
datatype (as above).

However, many PyTorch calculations default to using `float32`.

So if you want to convert your NumPy array (float64) -\> PyTorch tensor
(float64) -\> PyTorch tensor (float32), you can use
`tensor = torch.from_numpy(array).type(torch.float32)`.
]



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [100]]]
    #v(-6pt)
    ```python
# Tensor to NumPy array
tensor = torch.ones(7) # create a tensor of ones with dtype=float32
numpy_tensor = tensor.numpy() # will be dtype=float32 unless changed
tensor, numpy_tensor
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([1., 1., 1., 1., 1., 1., 1.]),
 array([1., 1., 1., 1., 1., 1., 1.], dtype=float32))
    ```
  ]
)


== #strong[8 Reproducibility]
<reproducibility>



Everytime the below code block runs, random\_tensor\_A gets a new value.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [103]]]
    #v(-6pt)
    ```python
import torch

# Create two random tensors
random_tensor_A = torch.rand(3, 4)

print(f"Tensor A:\n{random_tensor_A}\n")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Tensor A:
tensor([[0.7539, 0.1952, 0.0050, 0.3068],
        [0.1165, 0.9103, 0.6440, 0.7071],
        [0.6581, 0.4913, 0.8913, 0.1447]])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [104]]]
    #v(-6pt)
    ```python
# Set the random seed
RANDOM_SEED=42 # try changing this to different values and see what happens to the numbers below

# Feed the random seed to PyTorch
torch.manual_seed(seed=RANDOM_SEED)

random_tensor_A = torch.rand(3, 4)
print(f"Tensor A:\n{random_tensor_A}\n")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Tensor A:
tensor([[0.8823, 0.9150, 0.3829, 0.9593],
        [0.3904, 0.6009, 0.2566, 0.7936],
        [0.9408, 0.1332, 0.9346, 0.5936]])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [105]]]
    #v(-6pt)
    ```python
# Set the random seed
RANDOM_SEED=42 # try changing this to different values and see what happens to the numbers below

# Feed the random seed to GPU
torch.cuda.manual_seed(seed=RANDOM_SEED)

random_tensor_A = torch.rand(3, 4, device='cuda')
print(f"Tensor A:\n{random_tensor_A}\n")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Tensor A:
tensor([[0.6130, 0.0101, 0.3984, 0.0403],
        [0.1563, 0.4825, 0.7362, 0.4060],
        [0.5189, 0.2867, 0.2416, 0.9228]], device='cuda:0')
    ```
  ]
)


== #strong[9 GPU Acceleration for High-Performance Computing]
<gpu-acceleration-for-high-performance-computing>



=== #strong[9.1 Theoretical Foundation]
<theoretical-foundation>
#strong[Graphics Processing Units (GPUs)] have revolutionized deep
learning by providing massively parallel computational capabilities.
Understanding GPU utilization is essential for practical deep learning
applications.

==== #strong[9.1.1 CPU vs GPU Architecture]
<cpu-vs-gpu-architecture>
#strong[Central Processing Unit (CPU):] - #strong[Design philosophy];:
Optimized for sequential processing and complex control logic -
#strong[Core count];: Typically 4-32 cores with sophisticated caching -
#strong[Memory];: Large, hierarchical cache systems - #strong[Best for];:
Complex branching, single-threaded performance, system management

#strong[Graphics Processing Unit (GPU):] - #strong[Design philosophy];:
Optimized for parallel processing of simple operations - #strong[Core
count];: Thousands of simple cores (e.g., 2,048-10,496 CUDA cores) -
#strong[Memory];: High-bandwidth memory (HBM) with lower latency
tolerance - #strong[Best for];: Matrix operations, element-wise
computations, data parallelism

==== #strong[9.1.2 CUDA Ecosystem]
<cuda-ecosystem>
#strong[CUDA (Compute Unified Device Architecture)] enables
general-purpose computing on NVIDIA GPUs: - #strong[Programming model];:
Parallel computing platform and API - #strong[Memory hierarchy];:
Global, shared, constant, and texture memory types - #strong[Execution
model];: Kernel launches with thread blocks and grids - #strong[Library
ecosystem];: cuBLAS, cuDNN, cuSPARSE for optimized operations

#strong[Note:] This tutorial focuses on NVIDIA GPUs with CUDA support.
Alternative platforms include AMD ROCm and Intel oneAPI, but CUDA
remains the most widely supported in deep learning frameworks.



=== #strong[9.2 Getting a GPU]
<getting-a-gpu>
To check if you’ve got access to a Nvidia GPU, you can run `!nvidia-smi`
where the `!` (also called bang) means "run this on the command line".



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [109]]]
    #v(-6pt)
    ```python
!nvidia-smi
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Thu Aug 21 17:54:19 2025       
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.183.01             Driver Version: 535.183.01   CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  Quadro K2200                   Off | 00000000:01:00.0  On |                  N/A |
| 43%   46C    P8               1W /  39W |    423MiB /  4096MiB |     21%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
|   1  NVIDIA GeForce RTX 3090        Off | 00000000:04:00.0 Off |                  N/A |
| 30%   37C    P8              25W / 350W |    358MiB / 24576MiB |      0%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A      1297      G   /usr/lib/xorg/Xorg                       
... [Output truncated for brevity] ...
    ```
  ]
)


If you don’t have a Nvidia GPU accessible, the above will output
something like:

```
NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running.
```

If you do have a GPU, the line above will output something like:

```
Wed Jan 19 22:09:08 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 495.46       Driver Version: 460.32.03    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla P100-PCIE...  Off  | 00000000:00:04.0 Off |                    0 |
| N/A   35C    P0    27W / 250W |      0MiB / 16280MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```



=== #strong[9.3 Getting PyTorch to run on the GPU]
<getting-pytorch-to-run-on-the-gpu>
You can test if PyTorch has access to a GPU using
#link("https://pytorch.org/docs/stable/generated/torch.cuda.is_available.html#torch.cuda.is_available")[`torch.cuda.is_available()`];.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [112]]]
    #v(-6pt)
    ```python
# Check CUDA availability and system configuration
# This diagnostic is crucial for ensuring optimal performance in deep learning workflows

import torch

# Primary CUDA availability check
cuda_available = torch.cuda.is_available()

print("=== GPU AVAILABILITY DIAGNOSTIC ===")
print(f"CUDA Available: {cuda_available}")

if cuda_available:
    # Detailed GPU information for performance optimization
    print(f"\n=== GPU HARDWARE DETAILS ===")
    print(f"Number of GPUs: {torch.cuda.device_count()}")
    print(f"Current GPU Device: {torch.cuda.current_device()}")
    print(f"GPU Name: {torch.cuda.get_device_name(0)}")

    # Memory analysis - critical for batch size optimization
    print(f"\n=== MEMORY CONFIGURATION ===")
    memory_allocated = torch.cuda.memory_allocated(0)
    memory_reserved = torch.cuda.memory_reserved(0)
    total_memory = torch.cuda.get_device_properties(0).total_memory

    print(f"Total GPU Memory: {total_memory / 1024**3:.2f} GB")
    print(f"Currently Allocated: {memory_allocated / 1024**2:.2f} MB")
    print(f"Currently Reserved: {memory_reserved / 1024**2:.2f} MB")
    print(f"Available Memory: {(total_memory - memory_reserved) / 1024**3:.2f} GB")

    # CUDA version compatibility
    print(f"\n=== SOFTWARE VERSIONS ===")
    print(f"PyTorch Version: {torch.__version__}")
    print(f"CUDA Version: {torch.version.cuda}")
    print(f"cuDNN Version: {torch.backends.cudnn.version()}")
    print(f"cuDNN Enabled: {torch.backends.cudnn.enabled}")

else:
    print("\n=== CPU-ONLY CONFIGURATION ===")
    print("GPU acceleration not available. Training will use CPU.")
    print("For large models, consider:")
    print("1. Cloud services (Google Colab, AWS, Azure)")
    print("2. CUDA-compatible GPU installation")
    print("3. Reduced model size and batch size for CPU training")

# Performance implications:
print(f"\n=== PERFORMANCE EXPECTATIONS ===")
if cuda_available:
    print("✓ GPU acceleration available - expect 10-100x speedup for large models")
    print("✓ Large batch sizes supported (limited by GPU memory)")
    print("✓ Suitable for production-scale training")
else:
    print("⚠ CPU-only mode - expect slower training")
    print("⚠ Smaller batch sizes recommended")
    print("⚠ Consider GPU resources for larger experiments")

cuda_available
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
=== GPU AVAILABILITY DIAGNOSTIC ===
CUDA Available: True

=== GPU HARDWARE DETAILS ===
Number of GPUs: 2
Current GPU Device: 0
GPU Name: NVIDIA GeForce RTX 3090

=== MEMORY CONFIGURATION ===
Total GPU Memory: 23.69 GB
Currently Allocated: 0.00 MB
Currently Reserved: 0.00 MB
Available Memory: 23.69 GB

=== SOFTWARE VERSIONS ===
PyTorch Version: 2.4.1+cu121
CUDA Version: 12.1
cuDNN Version: 90100
cuDNN Enabled: True

=== PERFORMANCE EXPECTATIONS ===
✓ GPU acceleration available - expect 10-100x speedup for large models
✓ Large batch sizes supported (limited by GPU memory)
✓ Suitable for production-scale training
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
True
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [113]]]
    #v(-6pt)
    ```python
# Set device type
device = "cuda" if torch.cuda.is_available() else "cpu"
device
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
'cuda'
    ```
  ]
)


If the above output `"cuda"` it means we can set all of our PyTorch code
to use the available CUDA device (a GPU) and if the output is `"cpu"`,
our PyTorch code will stick with the CPU.

#quote(block: true)[
#strong[Note:] In PyTorch, it’s best practice to write
#link("https://pytorch.org/docs/master/notes/cuda.html#device-agnostic-code")[#strong[device agnostic code];];.
This means that the code will run on CPU (always available) or GPU (if
available).
]



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [115]]]
    #v(-6pt)
    ```python
# Count number of devices
torch.cuda.device_count()
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
2
    ```
  ]
)


=== #strong[9.4 Putting tensors (and models) on the GPU]
<putting-tensors-and-models-on-the-gpu>
You can put tensors (and models, we’ll see this later) on a specific
device by calling
#link("https://pytorch.org/docs/stable/generated/torch.Tensor.to.html")[`to(device)`]
on them. Where `device` is the target device you’d like the tensor (or
model) to go to.

Why do this?

GPUs offer far faster numerical computing than CPUs do and if a GPU
isn’t available, because of our #strong[device agnostic code] (see
above), it’ll run on the CPU.

#quote(block: true)[
#strong[Note:] Putting a tensor on GPU using `to(device)`
(e.g.~`some_tensor.to(device)`) returns a copy of that tensor, e.g.~the
same tensor will be on CPU and GPU. To overwrite tensors, reassign them:

`some_tensor = some_tensor.to(device)`
]

Let’s try creating a tensor and putting it on the GPU (if it’s
available).



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [117]]]
    #v(-6pt)
    ```python
# Create tensor (default on CPU)
tensor = torch.tensor([1, 2, 3])

# Tensor not on GPU
print(tensor, tensor.device)

# Move tensor to GPU (if available)
tensor_on_gpu = tensor.to(device)
tensor_on_gpu
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3]) cpu
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3], device='cuda:0')
    ```
  ]
)


If you have a GPU available, the above code will output something like:

```
tensor([1, 2, 3]) cpu
tensor([1, 2, 3], device='cuda:0')
```

Notice the second tensor has `device='cuda:0'`, this means it’s stored
on the 0th GPU available (GPUs are 0 indexed, if two GPUs were
available, they’d be `'cuda:0'` and `'cuda:1'` respectively, up to
`'cuda:n'`).



=== #strong[9.5 Moving tensors back to the CPU]
<moving-tensors-back-to-the-cpu>
What if we wanted to move the tensor back to CPU?

For example, you’ll want to do this if you want to interact with your
tensors with NumPy (NumPy does not leverage the GPU).

Let’s try using the
#link("https://pytorch.org/docs/stable/generated/torch.Tensor.numpy.html")[`torch.Tensor.numpy()`]
method on our `tensor_on_gpu`.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [120]]]
    #v(-6pt)
    ```python
# If tensor is on GPU, can't transform it to NumPy (this will error)
tensor_on_gpu.numpy()
    ```
  ]
)


Instead, to get a tensor back to CPU and usable with NumPy we can use
#link("https://pytorch.org/docs/stable/generated/torch.Tensor.cpu.html")[`Tensor.cpu()`];.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [122]]]
    #v(-6pt)
    ```python
# Instead, copy the tensor back to cpu
tensor_back_on_cpu = tensor_on_gpu.cpu().numpy()
tensor_back_on_cpu
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
array([1, 2, 3])
    ```
  ]
)


The above returns a copy of the GPU tensor in CPU memory so the original
tensor is still on GPU.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [124]]]
    #v(-6pt)
    ```python
tensor_on_gpu
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3], device='cuda:0')
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [125]]]
    #v(-6pt)
    ```python
tensor_on_gpu.to('cpu')
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([1, 2, 3])
    ```
  ]
)


== #strong[10 Most Common Errors]
<most-common-errors>



Because much of deep learning is multiplying and performing operations
on matrices and matrices have a strict rule about what shapes and sizes
can be combined, one of the most common errors you’ll run into in deep
learning is shape mismatches.



=== #strong[10.1 Tensor shape]
<tensor-shape>



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [129]]]
    #v(-6pt)
    ```python
# Shapes need to be in the right way
tensor_A = torch.tensor([[1, 2],
                         [3, 4],
                         [5, 6]], dtype=torch.float32)

tensor_B = torch.tensor([[7, 10],
                         [8, 11],
                         [9, 12]], dtype=torch.float32)

torch.matmul(tensor_A, tensor_B) # (this will error)
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [130]]]
    #v(-6pt)
    ```python
# View tensor_A and tensor_B
print(tensor_A)
print(tensor_B)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[1., 2.],
        [3., 4.],
        [5., 6.]])
tensor([[ 7., 10.],
        [ 8., 11.],
        [ 9., 12.]])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [131]]]
    #v(-6pt)
    ```python
# View tensor_A and tensor_B.T
print(tensor_A)
print(tensor_B.T)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[1., 2.],
        [3., 4.],
        [5., 6.]])
tensor([[ 7.,  8.,  9.],
        [10., 11., 12.]])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [132]]]
    #v(-6pt)
    ```python
# The operation works when tensor_B is transposed
print(f"Original shapes: tensor_A = {tensor_A.shape}, tensor_B = {tensor_B.shape}\n")
print(f"New shapes: tensor_A = {tensor_A.shape} (same as above), tensor_B.T = {tensor_B.T.shape}\n")
print(f"Multiplying: {tensor_A.shape} * {tensor_B.T.shape} <- inner dimensions match\n")
print("Output:\n")
output = torch.matmul(tensor_A, tensor_B.T)
print(output)
print(f"\nOutput shape: {output.shape}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Original shapes: tensor_A = torch.Size([3, 2]), tensor_B = torch.Size([3, 2])

New shapes: tensor_A = torch.Size([3, 2]) (same as above), tensor_B.T = torch.Size([2, 3])

Multiplying: torch.Size([3, 2]) * torch.Size([2, 3]) <- inner dimensions match

Output:

tensor([[ 27.,  30.,  33.],
        [ 61.,  68.,  75.],
        [ 95., 106., 117.]])

Output shape: torch.Size([3, 3])
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [133]]]
    #v(-6pt)
    ```python
# torch.mm is a shortcut for matmul
torch.mm(tensor_A, tensor_B.T)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[ 27.,  30.,  33.],
        [ 61.,  68.,  75.],
        [ 95., 106., 117.]])
    ```
  ]
)


=== #strong[10.2 Tensor datatype]
<tensor-datatype>



As mentioned, a common issue with deep learning operations is having
your tensors in different datatypes.

If one tensor is in `torch.float64` and another is in `torch.float32`,
you might run into some errors.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [136]]]
    #v(-6pt)
    ```python
tensor1 = torch.arange(10., 100., 10., dtype=torch.float16)
tensor2 = torch.arange(10., 100., 10.)

tensor1@tensor2
    ```
  ]
)


You can change the datatypes of tensors using
#link("https://pytorch.org/docs/stable/generated/torch.Tensor.type.html")[`torch.Tensor.type(dtype=None)`]
where the `dtype` parameter is the datatype you’d like to use.

First we’ll create a tensor and check its datatype (the default is
`torch.float32`).



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [138]]]
    #v(-6pt)
    ```python
# Create a tensor and check its datatype
tensor = torch.arange(10., 100., 10.)
tensor.dtype
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
torch.float32
    ```
  ]
)


Now we’ll create another tensor the same as before but change its
datatype to `torch.float16`.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [140]]]
    #v(-6pt)
    ```python
# Create a float16 tensor
tensor_float16 = tensor.type(torch.float16)
tensor_float16
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([10., 20., 30., 40., 50., 60., 70., 80., 90.], dtype=torch.float16)
    ```
  ]
)


And we can do something similar to make a `torch.int8` tensor.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [142]]]
    #v(-6pt)
    ```python
tensor1@tensor2.type(torch.float16)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor(28496., dtype=torch.float16)
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [143]]]
    #v(-6pt)
    ```python
tensor1.type(torch.float32)@tensor2
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor(28500.)
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [144]]]
    #v(-6pt)
    ```python
# Create an int8 tensor
tensor_int8 = tensor.type(torch.int8)
tensor_int8
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([10, 20, 30, 40, 50, 60, 70, 80, 90], dtype=torch.int8)
    ```
  ]
)


=== #strong[10.3 Tensor device]
<tensor-device>



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [146]]]
    #v(-6pt)
    ```python
tensor1 = torch.arange(10., 100., 10., device='cpu')
tensor2 = torch.arange(10., 100., 10., device='cuda')

tensor1@tensor2
    ```
  ]
)


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [147]]]
    #v(-6pt)
    ```python
tensor1.to('cuda')@tensor2
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("1a365d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor(28500., device='cuda:0')
    ```
  ]
)


== #strong[\11. Summary and Debugging Guidelines]
<summary-and-debugging-guidelines>



=== #strong[11.1 Common Error Categories in PyTorch]
<common-error-categories-in-pytorch>
When developing deep learning applications, most errors fall into three
primary categories. Remember this diagnostic song for systematic
debugging:

#quote(block: true)[
#strong["What, What, Where"] - #emph[A PyTorch Debugging Mantra]

#emph["What shape are my tensors, what datatype are they, and where are
they stored?#emph[ ];What shape, what datatype, what what where!"]
]

==== #strong[11.1.1 Shape Mismatches]
<shape-mismatches>
- #strong[Symptom];: RuntimeError involving tensor dimensions
- #strong[Common causes];: Incompatible matrix multiplication
  dimensions, CNN input/output mismatches
- #strong[Solution strategy];: Print tensor shapes before operations,
  use `tensor.view()` or `tensor.reshape()`

==== #strong[11.1.2 Datatype Incompatibilities]
<datatype-incompatibilities>
- #strong[Symptom];: Operations between different precision tensors
  (e.g., float32 vs float64)
- #strong[Common causes];: Mixed precision in model parameters and data
- #strong[Solution strategy];: Use `tensor.type(torch.float32)` for
  consistent datatypes

==== #strong[11.1.3 Device Mismatches]
<device-mismatches>
- #strong[Symptom];: Attempting operations between CPU and GPU tensors
- #strong[Common causes];: Forgetting to move tensors to the same device
- #strong[Solution strategy];: Implement device-agnostic code with
  `tensor.to(device)`

=== #strong[11.2 Best Practices for Production Code]
<best-practices-for-production-code>
+ #strong[Device Agnostic Development];: Always write code that works on
  both CPU and GPU
+ #strong[Memory Management];: Monitor GPU memory usage and implement
  proper cleanup
+ #strong[Reproducibility];: Set random seeds for consistent
  experimental results
+ #strong[Error Handling];: Implement robust error checking for tensor
  operations

