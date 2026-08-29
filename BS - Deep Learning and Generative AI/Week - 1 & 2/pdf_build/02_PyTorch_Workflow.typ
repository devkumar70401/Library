
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
        align(right)[#text(size: 8.5pt, fill: rgb("22543d"), weight: "bold")[PyTorch Workflow & Modeling]]
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
    fill: rgb("22543d"),
    inset: 16pt,
    radius: 6pt,
    width: 100%,
    [
      #text(fill: white, size: 18pt, weight: "bold")[PyTorch Workflow & Modeling] \
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
    #text(weight: "bold", size: 10pt, fill: rgb("22543d"))[Notebook Overview & Key Topics Covered:] \
    #v(3pt)
    #text(size: 9pt, fill: rgb("#4a5568"))[Data Ingestion, Custom nn.Module Architecture, Forward Propagation, Loss Computation, Optimizers, Training Loop, Evaluation & Checkpointing]
  ]
)

#v(10pt)

= #strong[PyTorch Workflow Fundamentals: A Comprehensive Guide to Deep Learning Model Development]
<pytorch-workflow-fundamentals-a-comprehensive-guide-to-deep-learning-model-development>
#strong[Course:] \[Course Name/Code\] \
#strong[Institution:] IIT Madras \
#strong[Author:] Prof.~Ganapathy Krishnamurthi \
#strong[Date:] \[Date\]

#horizontalrule

== #strong[Learning Objectives]
<learning-objectives>
By the end of this tutorial, students will be able to:

+ #strong[Understand] the complete PyTorch workflow for deep learning
  model development
+ #strong[Implement] data preparation, model building, training, and
  evaluation procedures
+ #strong[Apply] PyTorch’s DataLoader for efficient data handling and
  batching
+ #strong[Create] custom loss functions for specific learning objectives
+ #strong[Evaluate] model performance using appropriate metrics and
  visualization techniques
+ #strong[Manage] model persistence through saving and loading
  mechanisms

#horizontalrule

== #strong[Prerequisites]
<prerequisites>
- Familiarity with PyTorch tensor operations and fundamentals
- Understanding of basic machine learning concepts (training, testing,
  overfitting)
- Knowledge of gradient descent and backpropagation algorithms
- Basic understanding of linear algebra and calculus



== #strong[\1. Overview and Theoretical Framework]
<overview-and-theoretical-framework>



=== #strong[1.1 Introduction to the PyTorch Workflow]
<introduction-to-the-pytorch-workflow>
This comprehensive tutorial covers the standard PyTorch workflow for
developing machine learning models. #strong[The workflow represents a
systematic approach to solving machine learning problems];, from data
preparation through model deployment. While this framework can be
adapted based on specific requirements, it encompasses the fundamental
steps necessary for most deep learning applications.

=== #strong[1.2 Pedagogical Approach]
<pedagogical-approach>
The workflow presented here follows established best practices in
machine learning engineering and research. Each component of the
workflow addresses specific challenges in the model development
lifecycle, ensuring reproducibility, maintainability, and scientific
rigor.



#emph[Figure 1.1: Complete PyTorch workflow diagram illustrating the
systematic approach to machine learning model development, from data
preparation through model evaluation and persistence.]

#emph[Source: learnpytorch.io]



=== #strong[1.3 Workflow Components and Learning Outcomes]
<workflow-components-and-learning-outcomes>
This tutorial demonstrates the workflow using a #strong[linear
regression case study] to predict patterns in synthetic data. The
methodological approach presented here is generalizable to complex deep
learning problems involving real-world datasets.

The workflow encompasses the following key components:

#figure(
  align(center)[#table(
    columns: (19.67%, 36.07%, 44.26%),
    align: (auto,auto,auto,),
    table.header([#strong[Module];], [#strong[Learning
      Outcomes];], [#strong[Practical Applications];],),
    table.hline(),
    [#strong[\1. Data Preparation and Loading];], [Master data creation,
    preprocessing, and efficient loading using DataLoader], [Foundation
    for handling real-world datasets, implementing batching strategies],
    [#strong[\2. Model Architecture Design];], [Understand model
    construction, loss functions, and optimization
    strategies], [Building neural networks with appropriate
    architectures for specific problems],
    [#strong[\3. Training and Optimization];], [Implement training loops
    with proper gradient computation and parameter updates], [Developing
    robust training procedures for deep learning models],
    [#strong[\4. Model Evaluation and Inference];], [Apply proper
    evaluation methodologies and make predictions on unseen
    data], [Assessing model performance and deploying models for
    practical applications],
    [#strong[\5. Model Persistence and Management];], [Manage model
    saving, loading, and versioning for reproducible
    research], [Ensuring reproducibility and facilitating model
    deployment],
    [#strong[\6. Advanced Techniques];], [Implement custom loss
    functions and data loading strategies], [Addressing specialized
    requirements in research and industry applications],
  )]
  , kind: table
  )

=== #strong[1.4 Mathematical Framework]
<mathematical-framework>
Throughout this tutorial, we implement the fundamental equation for
linear regression:

#strong[ŷ = Wx + b]

Where: - #strong[ŷ];: Predicted output - #strong[W];: Weight parameter
(slope) - #strong[x];: Input feature - #strong[b];: Bias parameter
(intercept)

This simple relationship serves as the foundation for understanding more
complex neural network architectures.



== #strong[\2. Data Preparation and Preprocessing]
<data-preparation-and-preprocessing>



=== #strong[2.1 Theoretical Foundation]
<theoretical-foundation>



#figure(image("images/web_e86aaa9607.png"),
  caption: [
    Machine learning conceptual framework showing the two-part process
    of data representation and model learning
  ]
)

#emph[Figure 2.1: Conceptual framework of machine learning as a two-part
process: numerical data representation and pattern learning through
mathematical models.]

#emph[Source: learnpytorch.io]

#strong[Machine learning fundamentally operates on two core principles:]

+ #strong[Data Representation];: Transform raw data into numerical
  representations suitable for mathematical operations
+ #strong[Pattern Learning];: Develop mathematical models that can learn
  optimal representations to minimize prediction errors

This framework applies universally across all machine learning domains,
from computer vision to natural language processing.



=== #strong[2.2 Experimental Design: Synthetic Data Generation]
<experimental-design-synthetic-data-generation>
#strong[We implement a controlled experiment using linear regression
with known parameters.] This approach enables us to:

+ #strong[Validate the learning algorithm];: Since we know the true
  parameters, we can verify that our model correctly recovers them
+ #strong[Understand the optimization process];: Observe how gradient
  descent converges to the optimal solution
+ #strong[Establish baseline performance];: Create a foundation for
  understanding more complex scenarios

#strong[Mathematical Formulation:] Our synthetic dataset follows the
linear relationship: #strong[y = W₀x + b₀ + ε]

Where: - #strong[W₀ = 0.7];: True weight parameter - #strong[b₀ = 0.3];:
True bias parameter \
\- #strong[ε];: Optional noise term (omitted in this controlled
experiment)



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [10]]]
    #v(-6pt)
    ```python
# Import essential libraries for deep learning and visualization
import torch
from torch import nn  # Contains all PyTorch building blocks for neural networks
import matplotlib.pyplot as plt

# Verify PyTorch installation and version compatibility
# This ensures reproducibility across different environments
print(f"PyTorch Version: {torch.__version__}")

# Display system information for debugging purposes
print(f"CUDA Available: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"CUDA Version: {torch.version.cuda}")
    print(f"GPU Device: {torch.cuda.get_device_name(0)}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
PyTorch Version: 2.4.1+cu121
CUDA Available: True
CUDA Version: 12.1
GPU Device: NVIDIA GeForce RTX 3090
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [11]]]
    #v(-6pt)
    ```python
# Define ground truth parameters for our linear regression experiment
# These represent the "true" relationship we want our model to learn
weight = 0.7  # True slope parameter (W₀)
bias = 0.3    # True intercept parameter (b₀)

# Generate synthetic dataset with known linear relationship
# Using a systematic sampling approach for reproducible results
start = 0      # Domain start point
end = 1        # Domain end point
step = 0.02    # Sampling interval (creates 50 data points)

# Create feature tensor with shape [n_samples, 1]
# The unsqueeze operation adds a dimension for compatibility with linear layers
X = torch.arange(start, end, step).unsqueeze(dim=1)

# Generate target values using the true linear relationship
# y = W₀ * x + b₀ (no noise added for this controlled experiment)
y = weight * X + bias

# Display sample data for verification
print(f"Dataset shape: X={X.shape}, y={y.shape}")
print(f"Sample data points:")
print(f"X (first 10): {X[:10].flatten()}")
print(f"y (first 10): {y[:10].flatten()}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Dataset shape: X=torch.Size([50, 1]), y=torch.Size([50, 1])
Sample data points:
X (first 10): tensor([0.0000, 0.0200, 0.0400, 0.0600, 0.0800, 0.1000, 0.1200, 0.1400, 0.1600,
        0.1800])
y (first 10): tensor([0.3000, 0.3140, 0.3280, 0.3420, 0.3560, 0.3700, 0.3840, 0.3980, 0.4120,
        0.4260])
    ```
  ]
)


=== #strong[2.3 Dataset Partitioning: Training and Testing Split]
<dataset-partitioning-training-and-testing-split>
#strong[Data partitioning represents a fundamental requirement in
machine learning to ensure unbiased model evaluation.] The separation of
data into distinct subsets serves different purposes in the model
development lifecycle.

==== #strong[2.3.1 Theoretical Justification]
<theoretical-justification>
Data splitting addresses the #strong[bias-variance tradeoff] and
prevents #strong[overfitting] by:

+ #strong[Training Set];: Enables parameter optimization through
  gradient descent
+ #strong[Validation Set];: Facilitates hyperparameter tuning and model
  selection
+ #strong[Test Set];: Provides unbiased performance estimation on unseen
  data

==== #strong[2.3.2 Standard Partitioning Protocols]
<standard-partitioning-protocols>
#figure(
  align(center)[#table(
    columns: (18.18%, 19.7%, 33.33%, 28.79%),
    align: (auto,auto,auto,auto,),
    table.header([#strong[Subset];], [#strong[Purpose];], [#strong[Typical
      Allocation];], [#strong[Usage Frequency];],),
    table.hline(),
    [#strong[Training Set];], [Parameter optimization and pattern
    learning], [60-80%], [Every training iteration],
    [#strong[Validation Set];], [Hyperparameter tuning and model
    selection], [10-20%], [During development phase],
    [#strong[Test Set];], [Final performance evaluation and
    generalization assessment], [10-20%], [Once at project completion],
  )]
  , kind: table
  )

==== #strong[2.3.3 Methodological Considerations]
<methodological-considerations>
#strong[Important:] In production machine learning systems, the test set
should remain completely isolated during the entire development process.
This ensures that performance metrics provide genuine estimates of model
generalization capability.



==== #strong[2.3.4 Best Practices in Data Management]
<best-practices-in-data-management>
#quote(block: true)[
#strong[Research Protocol:] In real-world applications, data
partitioning should occur immediately after data collection and
preprocessing. The test set must remain isolated throughout the entire
model development lifecycle to maintain scientific integrity and ensure
valid generalization estimates. This principle, known as #strong[data
leakage prevention];, is essential for reproducible research and
reliable model deployment.
]



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
# Implement 80-20 train-test split following standard ML protocols
# This ratio provides sufficient training data while reserving adequate samples for evaluation
train_split = int(0.8 * len(X))  # 80% allocation for training

# Partition the dataset using temporal ordering (first 80% for training)
# Note: In practice, random shuffling is often preferred to avoid temporal bias
X_train, y_train = X[:train_split], y[:train_split]
X_test, y_test = X[train_split:], y[train_split:]

# Verify partitioning results
print(f"Dataset Partitioning Summary:")
print(f"Training Set: {len(X_train)} samples ({len(X_train)/len(X)*100:.1f}%)")
print(f"Test Set: {len(X_test)} samples ({len(X_test)/len(X)*100:.1f}%)")
print(f"Total Samples: {len(X_train) + len(X_test)}")

# Verify data integrity
assert len(X_train) + len(X_test) == len(X), "Data partitioning error detected"
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Dataset Partitioning Summary:
Training Set: 40 samples (80.0%)
Test Set: 10 samples (20.0%)
Total Samples: 50
    ```
  ]
)


=== #strong[2.4 Efficient Data Loading with PyTorch DataLoader]
<efficient-data-loading-with-pytorch-dataloader>
==== #strong[2.4.1 Theoretical Motivation]
<theoretical-motivation>
#strong[DataLoader provides essential infrastructure for efficient,
scalable data handling in machine learning pipelines.] While our current
dataset is small enough to fit in memory, understanding DataLoader
concepts is crucial for:

+ #strong[Batch Processing];: Enabling mini-batch gradient descent for
  large datasets
+ #strong[Memory Management];: Handling datasets larger than available
  RAM
+ #strong[Parallelization];: Leveraging multiple CPU cores for data
  preprocessing
+ #strong[Reproducibility];: Controlling randomization and shuffling
  procedures

==== #strong[2.4.2 Core Concepts]
<core-concepts>
- #strong[Batch Size];: Number of samples processed simultaneously
  during each forward pass
- #strong[Shuffling];: Random reordering of samples to prevent
  order-dependent bias
- #strong[Data Pipeline];: Systematic approach to data loading,
  preprocessing, and augmentation



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
# Import necessary components for data loading
from torch.utils.data import TensorDataset, DataLoader

# Create TensorDataset objects for efficient data handling
# TensorDataset wraps tensors to provide indexing and length operations
train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)

# Configure DataLoader parameters for training and testing
BATCH_SIZE = 8  # Small batch size for demonstration (typically 32, 64, 128, or 256)
NUM_WORKERS = 0  # Number of subprocesses for data loading (set to 0 for single-threaded)

# Create DataLoader instances
# Training DataLoader with shuffling to prevent order bias
train_dataloader = DataLoader(
    dataset=train_dataset,
    batch_size=BATCH_SIZE,
    shuffle=True,  # Randomize sample order for each epoch
    num_workers=NUM_WORKERS
)

# Test DataLoader without shuffling to maintain reproducible evaluation
test_dataloader = DataLoader(
    dataset=test_dataset,
    batch_size=BATCH_SIZE,
    shuffle=False,  # Preserve original order for consistent evaluation
    num_workers=NUM_WORKERS
)

# Display DataLoader properties
print(f"DataLoader Configuration:")
print(f"Training Batches: {len(train_dataloader)}")
print(f"Test Batches: {len(test_dataloader)}")
print(f"Batch Size: {BATCH_SIZE}")
print(f"Total Training Samples: {len(train_dataset)}")
print(f"Total Test Samples: {len(test_dataset)}")

# Demonstrate batch iteration
print(f"\nFirst Training Batch:")
for batch_X, batch_y in train_dataloader:
    print(f"Batch X shape: {batch_X.shape}")
    print(f"Batch y shape: {batch_y.shape}")
    print(f"Batch X: {batch_X.flatten()}")
    print(f"Batch y: {batch_y.flatten()}")
    break  # Only show first batch
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
DataLoader Configuration:
Training Batches: 5
Test Batches: 2
Batch Size: 8
Total Training Samples: 40
Total Test Samples: 10

First Training Batch:
Batch X shape: torch.Size([8, 1])
Batch y shape: torch.Size([8, 1])
Batch X: tensor([0.3400, 0.3600, 0.6200, 0.4200, 0.4400, 0.4800, 0.3800, 0.1000])
Batch y: tensor([0.5380, 0.5520, 0.7340, 0.5940, 0.6080, 0.6360, 0.5660, 0.3700])
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [17]]]
    #v(-6pt)
    ```python
def plot_predictions(train_data=X_train,
                     train_labels=y_train,
                     test_data=X_test,
                     test_labels=y_test,
                     predictions=None):
    """
    Visualize training data, test data, and model predictions for regression analysis.

    This function creates a comprehensive visualization that enables:
    1. Assessment of data distribution and quality
    2. Evaluation of model prediction accuracy
    3. Identification of potential overfitting or underfitting patterns

    Parameters:
    -----------
    train_data : torch.Tensor
        Training feature values for visualization
    train_labels : torch.Tensor
        Training target values for visualization
    test_data : torch.Tensor
        Test feature values for visualization
    test_labels : torch.Tensor
        Test target values for visualization
    predictions : torch.Tensor, optional
        Model predictions on test data for comparison

    Returns:
    --------
    None
        Displays matplotlib figure with data visualization
    """
    # Configure figure with professional formatting
    plt.figure(figsize=(12, 8))

    # Plot training data with distinct visual encoding
    plt.scatter(train_data, train_labels,
               c="blue", s=25, alpha=0.7,
               label="Training Data", marker='o')

    # Plot test data with distinct visual encoding
    plt.scatter(test_data, test_labels,
               c="green", s=25, alpha=0.7,
               label="Test Data", marker='s')

    # Plot predictions if provided
    if predictions is not None:
        plt.scatter(test_data, predictions,
                   c="red", s=25, alpha=0.8,
                   label="Model Predictions", marker='^')

    # Configure professional plot formatting
    plt.xlabel("Input Features (x)", fontsize=12)
    plt.ylabel("Target Values (y)", fontsize=12)
    plt.title("Linear Regression: Data Distribution and Model Predictions",
              fontsize=14, fontweight='bold')
    plt.legend(fontsize=11)
    plt.grid(True, alpha=0.3)
    plt.tight_layout()

    # Display the plot
    plt.show()
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [18]]]
    #v(-6pt)
    ```python
plot_predictions();
    ```
  ]
)


#align(center)[
  #v(4pt)
  #image("images/img_02_1.png", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell 18]
  #v(4pt)
]


== #strong[\3. Model Architecture and Design]
<model-architecture-and-design>



=== #strong[3.1 Theoretical Foundation of Neural Network Construction]
<theoretical-foundation-of-neural-network-construction>



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [21]]]
    #v(-6pt)
    ```python
# Define Linear Regression Model Architecture
# This implementation demonstrates fundamental PyTorch model construction principles

class LinearRegressionModel(nn.Module):
    """
    Linear Regression Model Implementation using PyTorch.

    This model implements the mathematical relationship: y = Wx + b
    where W and b are learnable parameters optimized through gradient descent.

    Architecture Details:
    - Input Dimension: 1 (single feature)
    - Output Dimension: 1 (single prediction)
    - Parameters: 2 (weight and bias)
    - Activation Function: None (linear transformation)
    """

    def __init__(self):
        """
        Initialize model parameters with random values.

        The super().__init__() call enables PyTorch's automatic differentiation
        and parameter management functionality.
        """
        super().__init__()

        # Initialize weight parameter with random normal distribution
        # requires_grad=True enables automatic gradient computation
        self.weights = nn.Parameter(
            torch.randn(1, dtype=torch.float),
            requires_grad=True
        )

        # Initialize bias parameter with random normal distribution
        self.bias = nn.Parameter(
            torch.randn(1, dtype=torch.float),
            requires_grad=True
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """
        Define forward pass computation.

        Parameters:
        -----------
        x : torch.Tensor
            Input features with shape [batch_size, input_dim]

        Returns:
        --------
        torch.Tensor
            Predictions with shape [batch_size, output_dim]
        """
        # Implement linear transformation: y = Wx + b
        return self.weights * x + self.bias
    ```
  ]
)


Alright there’s a fair bit going on above but let’s break it down bit by
bit.

```python
class LinearRegressionModel(nn.Module): # <- almost everything in PyTorch is a nn.Module (think of this as neural network lego blocks)
    def __init__(self):
        super().__init__()
        self.weights = nn.Parameter(torch.randn(1, # <- start with random weights (this will get adjusted as the model learns)
                                                dtype=torch.float), # <- PyTorch loves float32 by default
                                   requires_grad=True) # <- can we update this value with gradient descent?)

        self.bias = nn.Parameter(torch.randn(1, # <- start with random bias (this will get adjusted as the model learns)
                                            dtype=torch.float), # <- PyTorch loves float32 by default
                                requires_grad=True) # <- can we update this value with gradient descent?))

    # Forward defines the computation in the model
    def forward(self, x: torch.Tensor) -> torch.Tensor: # <- "x" is the input data (e.g. training/testing features)
        return self.weights * x + self.bias # <- this is the linear regression formula (y = m*x + b)
```



=== #strong[3.2 PyTorch model building essentials]
<pytorch-model-building-essentials>
PyTorch has four (give or take) essential modules you can use to create
almost any kind of neural network you can imagine.



They are #link("https://pytorch.org/docs/stable/nn.html")[`torch.nn`];,
#link("https://pytorch.org/docs/stable/optim.html")[`torch.optim`];,
#link("https://pytorch.org/docs/stable/data.html#torch.utils.data.Dataset")[`torch.utils.data.Dataset`]
and
#link("https://pytorch.org/docs/stable/data.html")[`torch.utils.data.DataLoader`];.
For now, we’ll focus on the first two and get to the other two later
(though you may be able to guess what they do).

#figure(
  align(center)[#table(
    columns: (50%, 50%),
    align: (auto,auto,),
    table.header([PyTorch module], [What does it do?],),
    table.hline(),
    [#link("https://pytorch.org/docs/stable/nn.html")[`torch.nn`];], [Contains
    all of the building blocks for computational graphs (essentially a
    series of computations executed in a particular way).],
    [#link("https://pytorch.org/docs/stable/generated/torch.nn.parameter.Parameter.html#parameter")[`torch.nn.Parameter`];], [Stores
    tensors that can be used with `nn.Module`. If `requires_grad=True`
    gradients (used for updating model parameters via
    #link("https://ml-cheatsheet.readthedocs.io/en/latest/gradient_descent.html")[#strong[gradient descent];];)
    are calculated automatically, this is often referred to as
    "autograd".],
    [#link("https://pytorch.org/docs/stable/generated/torch.nn.Module.html#torch.nn.Module")[`torch.nn.Module`];], [The
    base class for all neural network modules, all the building blocks
    for neural networks are subclasses. If you’re building a neural
    network in PyTorch, your models should subclass `nn.Module`.
    Requires a `forward()` method be implemented.],
    [#link("https://pytorch.org/docs/stable/optim.html")[`torch.optim`];], [Contains
    various optimization algorithms (these tell the model parameters
    stored in `nn.Parameter` how to best change to improve gradient
    descent and in turn reduce the loss).],
    [`def forward()`], [All `nn.Module` subclasses require a `forward()`
    method, this defines the computation that will take place on the
    data passed to the particular `nn.Module` (e.g.~the linear
    regression formula above).],
  )]
  , kind: table
  )



If the above sounds complex, think of like this, almost everything in a
PyTorch neural network comes from `torch.nn`, \* `nn.Module` contains
the larger building blocks (layers) \* `nn.Parameter` contains the
smaller parameters like weights and biases (put these together to make
`nn.Module`(s)) \* `forward()` tells the larger blocks how to make
calculations on inputs (tensors full of data) within `nn.Module`(s) \*
`torch.optim` contains optimization methods on how to improve the
parameters within `nn.Parameter` to better represent input data

#figure(image("images/web_69a9719f37.png"),
  caption: [
    a pytorch linear model with annotations
  ]
)

Source: learnpytorch.io



=== #strong[3.3 Custom Loss Functions: Theory and Implementation]
<custom-loss-functions-theory-and-implementation>
==== #strong[3.3.1 Mathematical Foundation]
<mathematical-foundation>
#strong[Loss functions quantify the discrepancy between model
predictions and ground truth values.] While PyTorch provides numerous
built-in loss functions, implementing custom loss functions enables:

+ #strong[Domain-Specific Optimization];: Incorporating problem-specific
  constraints and requirements
+ #strong[Research Innovation];: Developing novel training objectives
  for specialized applications
+ #strong[Multi-Objective Learning];: Combining multiple loss terms with
  appropriate weighting strategies

==== #strong[3.3.2 Loss Function Design Principles]
<loss-function-design-principles>
Effective loss functions should satisfy several mathematical properties:

- #strong[Differentiability];: Enable gradient-based optimization
  through backpropagation
- #strong[Convexity] (when possible): Facilitate convergence to global
  minima
- #strong[Numerical Stability];: Avoid computational issues such as
  overflow or underflow
- #strong[Problem Alignment];: Reflect the true optimization objective
  of the application



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [27]]]
    #v(-6pt)
    ```python
# Custom Loss Function Implementations

class MeanAbsoluteError(nn.Module):
    """
    Custom implementation of Mean Absolute Error (L1 Loss).

    Mathematical Definition:
    MAE = (1/n) * Σ|y_true - y_pred|

    This implementation demonstrates the structure for creating custom loss functions
    while replicating the functionality of PyTorch's built-in nn.L1Loss().
    """

    def __init__(self):
        super().__init__()

    def forward(self, predictions: torch.Tensor, targets: torch.Tensor) -> torch.Tensor:
        """
        Compute Mean Absolute Error between predictions and targets.

        Parameters:
        -----------
        predictions : torch.Tensor
            Model predictions with shape [batch_size, output_dim]
        targets : torch.Tensor
            Ground truth values with shape [batch_size, output_dim]

        Returns:
        --------
        torch.Tensor
            Scalar loss value
        """
        # Compute absolute differences
        absolute_errors = torch.abs(predictions - targets)

        # Return mean across all elements
        return torch.mean(absolute_errors)


class HuberLoss(nn.Module):
    """
    Custom Huber Loss implementation.

    Huber loss combines the advantages of MSE and MAE:
    - Quadratic for small errors (smooth gradients)
    - Linear for large errors (robust to outliers)

    Mathematical Definition:
    L_δ(a) = { 0.5 * a²      if |a| ≤ δ
             { δ * |a| - 0.5 * δ²  if |a| > δ

    where a = y_true - y_pred and δ is the threshold parameter.
    """

    def __init__(self, delta: float = 1.0):
        """
        Initialize Huber loss with specified threshold.

        Parameters:
        -----------
        delta : float
            Threshold parameter controlling transition between quadratic and linear regions
        """
        super().__init__()
        self.delta = delta

    def forward(self, predictions: torch.Tensor, targets: torch.Tensor) -> torch.Tensor:
        """
        Compute Huber loss between predictions and targets.

        Parameters:
        -----------
        predictions : torch.Tensor
            Model predictions
        targets : torch.Tensor
            Ground truth values

        Returns:
        --------
        torch.Tensor
            Scalar loss value
        """
        # Compute residuals
        residuals = predictions - targets
        abs_residuals = torch.abs(residuals)

        # Apply Huber loss formulation
        quadratic_mask = abs_residuals <= self.delta
        linear_mask = abs_residuals > self.delta

        # Quadratic component: 0.5 * residual²
        quadratic_loss = 0.5 * residuals ** 2

        # Linear component: δ * |residual| - 0.5 * δ²
        linear_loss = self.delta * abs_residuals - 0.5 * self.delta ** 2

        # Combine components based on masks
        loss = quadratic_mask * quadratic_loss + linear_mask * linear_loss

        return torch.mean(loss)


# Demonstrate custom loss function instantiation
custom_mae_loss = MeanAbsoluteError()
huber_loss = HuberLoss(delta=1.0)

print("Custom Loss Functions Initialized:")
print(f"Custom MAE Loss: {custom_mae_loss}")
print(f"Huber Loss (δ=1.0): {huber_loss}")

# Test custom loss functions with sample data
sample_predictions = torch.tensor([1.0, 2.0, 3.0])
sample_targets = torch.tensor([1.1, 1.8, 3.2])

print(f"\nLoss Function Comparison (Sample Data):")
print(f"Built-in L1Loss: {nn.L1Loss()(sample_predictions, sample_targets):.4f}")
print(f"Custom MAE Loss: {custom_mae_loss(sample_predictions, sample_targets):.4f}")
print(f"Huber Loss: {huber_loss(sample_predictions, sample_targets):.4f}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Custom Loss Functions Initialized:
Custom MAE Loss: MeanAbsoluteError()
Huber Loss (δ=1.0): HuberLoss()

Loss Function Comparison (Sample Data):
Built-in L1Loss: 0.1667
Custom MAE Loss: 0.1667
Huber Loss: 0.0150
    ```
  ]
)


=== #strong[3.4 Checking the contents of a PyTorch model]
<checking-the-contents-of-a-pytorch-model>



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [29]]]
    #v(-6pt)
    ```python
# Set manual seed since nn.Parameter are randomly initialized
torch.manual_seed(42)

# Create an instance of the model (this is a subclass of nn.Module that contains nn.Parameter(s))
model_0 = LinearRegressionModel()

# Check the nn.Parameter(s) within the nn.Module subclass we created
list(model_0.parameters())
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
[Parameter containing:
 tensor([0.3367], requires_grad=True),
 Parameter containing:
 tensor([0.1288], requires_grad=True)]
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [30]]]
    #v(-6pt)
    ```python
# List named parameters
model_0.state_dict()
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
OrderedDict([('weights', tensor([0.3367])), ('bias', tensor([0.1288]))])
    ```
  ]
)


=== #strong[3.5 Making predictions]
<making-predictions>



When we pass data to our model, it’ll go through the model’s `forward()`
method and produce a result using the computation we’ve defined.

Let’s make some predictions.



#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [33]]]
    #v(-6pt)
    ```python
# Make predictions with model
with torch.inference_mode():
    y_preds = model_0(X_test)
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [34]]]
    #v(-6pt)
    ```python

# Note: in older PyTorch code you might also see torch.no_grad()
with torch.no_grad():
  y_preds = model_0(X_test)
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
# Check the predictions
print(f"Number of testing samples: {len(X_test)}")
print(f"Number of predictions made: {len(y_preds)}")
print(f"Predicted values:\n{y_preds}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Number of testing samples: 10
Number of predictions made: 10
Predicted values:
tensor([[0.3982],
        [0.4049],
        [0.4116],
        [0.4184],
        [0.4251],
        [0.4318],
        [0.4386],
        [0.4453],
        [0.4520],
        [0.4588]])
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [36]]]
    #v(-6pt)
    ```python
plot_predictions(predictions=y_preds)
    ```
  ]
)


#align(center)[
  #v(4pt)
  #image("images/img_02_2.png", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell 36]
  #v(4pt)
]


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
y_test - y_preds
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[0.4618],
        [0.4691],
        [0.4764],
        [0.4836],
        [0.4909],
        [0.4982],
        [0.5054],
        [0.5127],
        [0.5200],
        [0.5272]])
    ```
  ]
)


== #strong[\4. Model Training and Optimization]
<model-training-and-optimization>



=== #strong[4.1 Theoretical Framework for Neural Network Training]
<theoretical-framework-for-neural-network-training>
#strong[The training process requires two fundamental components: a loss
function to quantify prediction errors and an optimization algorithm to
update model parameters.] These components work synergistically to
enable automatic parameter learning through gradient-based optimization.

==== #strong[4.1.1 Mathematical Framework]
<mathematical-framework>
The optimization process follows the iterative update rule:

#strong[θₜ₊₁ = θₜ - η∇θL(θₜ)]

Where: - #strong[θₜ];: Parameters at iteration t - #strong[η];: Learning
rate (step size) - #strong[∇θL(θₜ)];: Gradient of loss function with
respect to parameters - #strong[L(θₜ)];: Loss function value at current
parameters

==== #strong[4.1.2 Component Selection Guidelines]
<component-selection-guidelines>
#figure(
  align(center)[#table(
    columns: (22.06%, 19.12%, 30.88%, 27.94%),
    align: (auto,auto,auto,auto,),
    table.header([#strong[Component];], [#strong[Purpose];], [#strong[PyTorch
      Location];], [#strong[Common Choices];],),
    table.hline(),
    [#strong[Loss Function];], [Quantifies prediction accuracy and
    provides optimization
    signal], [#link("https://pytorch.org/docs/stable/nn.html#loss-functions")[`torch.nn`];], [MAE
    (`nn.L1Loss`) for regression, Cross-entropy (`nn.CrossEntropyLoss`)
    for classification],
    [#strong[Optimizer];], [Implements parameter update rules using
    gradient
    information], [#link("https://pytorch.org/docs/stable/optim.html")[`torch.optim`];], [SGD
    (`torch.optim.SGD`) for stability, Adam (`torch.optim.Adam`) for
    adaptive learning],
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [40]]]
    #v(-6pt)
    ```python
# Configure loss function for regression task
# Mean Absolute Error (L1 Loss) provides robust optimization for linear regression
loss_fn = nn.L1Loss()

# Alternative: Use custom loss function for demonstration
# loss_fn = custom_mae_loss  # Equivalent to nn.L1Loss()
# loss_fn = huber_loss       # Robust to outliers

# Configure optimization algorithm
# Stochastic Gradient Descent (SGD) with appropriate learning rate
optimizer = torch.optim.SGD(
    params=model_0.parameters(),  # Target model parameters for optimization
    lr=0.001                       # Learning rate (α): controls step size in parameter space
)

print(f"Training Configuration:")
print(f"Loss Function: {loss_fn}")
print(f"Optimizer: {optimizer}")
print(f"Learning Rate: {optimizer.param_groups[0]['lr']}")
print(f"Parameters to Optimize: {len(list(model_0.parameters()))}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Training Configuration:
Loss Function: L1Loss()
Optimizer: SGD (
Parameter Group 0
    dampening: 0
    differentiable: False
    foreach: None
    fused: None
    lr: 0.001
    maximize: False
    momentum: 0
    nesterov: False
    weight_decay: 0
)
Learning Rate: 0.001
Parameters to Optimize: 2
    ```
  ]
)


=== #strong[4.2 Training and Evaluation Loop Implementation]
<training-and-evaluation-loop-implementation>
#strong[The optimization process requires systematic iteration through
training and evaluation phases.] This systematic approach ensures proper
model learning while monitoring generalization performance.

==== #strong[4.2.1 Methodological Approach]
<methodological-approach>
#strong[Training Phase];: Optimizes model parameters using gradient
descent on training data

#strong[Evaluation Phase];: Assesses model performance on test data
without parameter updates

The separation of these phases prevents #strong[information leakage]
from test data into the training process, ensuring valid performance
estimates.



==== #strong[4.2.2 Training Loop: Systematic Parameter Optimization]
<training-loop-systematic-parameter-optimization>
#strong[The training loop implements the core gradient descent algorithm
through five essential steps executed iteratively.] Each step serves a
specific mathematical purpose in the optimization process.

==== #strong[4.2.3 Training Phase Steps]
<training-phase-steps>
#figure(
  align(center)[#table(
    columns: (12.99%, 19.48%, 32.47%, 35.06%),
    align: (auto,auto,auto,auto,),
    table.header([#strong[Step];], [#strong[Operation];], [#strong[Mathematical
      Purpose];], [#strong[PyTorch Implementation];],),
    table.hline(),
    [1], [#strong[Forward Pass];], [Compute predictions using current
    parameters], [`y_pred = model(X_train)`],
    [2], [#strong[Loss Calculation];], [Quantify prediction error
    against ground truth], [`loss = loss_fn(y_pred, y_train)`],
    [3], [#strong[Gradient Zeroing];], [Reset accumulated gradients from
    previous iterations], [`optimizer.zero_grad()`],
    [4], [#strong[Backpropagation];], [Compute gradients via automatic
    differentiation], [`loss.backward()`],
    [5], [#strong[Parameter Update];], [Apply gradient descent update
    rule], [`optimizer.step()`],
  )]
  , kind: table
  )

==== #strong[4.2.4 Mathematical Interpretation]
<mathematical-interpretation>
Each step corresponds to a specific component of the gradient descent
algorithm:

- #strong[Steps 1-2];: Implement the loss function #strong[L(θ) =
  f(h\_θ(X), y)]
- #strong[Step 3];: Ensures clean gradient computation for current
  iteration
- #strong[Step 4];: Computes \*\*∇\_θ L(θ)\*\* using chain rule via
  backpropagation
- #strong[Step 5];: Updates parameters using \*\*θ := θ - η∇\_θ L(θ)\*\*

==== #strong[4.2.5 Training in Pytorch]
<training-in-pytorch>
#figure(image("images/web_6b848ada32.png"),
  caption: [
    PyTorch optimization loop conceptual diagram
  ]
)

#emph[Source: learnpytorch.io]



```python
# Set the number of epochs (how many times the model will pass over the training data)
epochs = 100
for epoch in range(epochs):
    ### Training

    # Put model in training mode (this is the default state of a model)
    model_0.train()

    # 1. Forward pass on train data using the forward() method inside
    y_pred = model_0(X_train)
    # print(y_pred)

    # 2. Calculate the loss (how different are our models predictions to the ground truth)
    loss = loss_fn(y_pred, y_train)

    # 3. Zero grad of the optimizer
    optimizer.zero_grad()

    # 4. Loss backwards
    loss.backward()

    # 5. Progress the optimizer
    optimizer.step()
```



#figure(image("images/web_83d1cb39ed.png"),
  caption: [
    pytorch training loop annotated
  ]
)

Source: learnpytorch.io



=== #strong[4.3 Testing loop Implementation]
<testing-loop-implementation>
As for the testing loop (evaluating our model), the typical steps
include:

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Number], [Step name], [What does it do?], [Code
      example],),
    table.hline(),
    [1], [Forward pass], [The model goes through all of the testing data
    once, performing its `forward()` function
    calculations.], [`model(x_test)`],
    [2], [Calculate the loss], [The model’s outputs (predictions) are
    compared to the ground truth and evaluated to see how wrong they
    are.], [`loss = loss_fn(y_pred, y_test)`],
    [3], [Calulate evaluation metrics (optional)], [Alongside the loss
    value you may want to calculate other evaluation metrics such as
    accuracy on the test set.], [Custom functions],
  )]
  , kind: table
  )



Notice the testing loop doesn’t contain performing backpropagation
(`loss.backward()`) or stepping the optimizer (`optimizer.step()`), this
is because no parameters in the model are being changed during testing,
they’ve already been calculated. For testing, we’re only interested in
the output of the forward pass through the model.

```python
    ### Testing

    # Put the model in evaluation mode
    model_0.eval()

    with torch.inference_mode():
      # 1. Forward pass on test data
      test_pred = model_0(X_test)

      # 2. Caculate loss on test data
      test_loss = loss_fn(test_pred, y_test.type(torch.float)) # predictions

      # Print out what's happening
      if epoch % 10 == 0:
            epoch_count.append(epoch)
            train_loss_values.append(loss.detach().numpy())
            test_loss_values.append(test_loss.detach().numpy())
            print(f"Epoch: {epoch} | MAE Train Loss: {loss} | MAE Test Loss: {test_loss} ")
```

#figure(image("images/web_f9ab36561c.png"),
  caption: [
    pytorch annotated testing loop
  ]
)

Source: learnpytorch.io

Let’s put all of the above together and train our model for 100
#strong[epochs] (forward passes through the data) and we’ll evaluate it
every 10 epochs.



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
# Set random seed for reproducible results across experiments
torch.manual_seed(42)

# Configure training hyperparameters
EPOCHS = 350  # Number of complete passes through the training dataset
PRINT_INTERVAL = 20  # Frequency for progress reporting

# Initialize tracking variables for loss curves
train_loss_values = []
test_loss_values = []
epoch_count = []

print("Training Progress:")
print("=" * 60)

# Main training loop: iterate through epochs
for epoch in range(EPOCHS):

    ### TRAINING PHASE ###
    model_0.train()  # Set model to training mode (enables gradient computation)

    # Initialize epoch training loss accumulator
    epoch_train_loss = 0.0
    num_train_batches = 0

    # Iterate through training batches using DataLoader
    for batch_X, batch_y in train_dataloader:

        # Step 1: Forward pass - compute predictions for current batch
        y_pred = model_0(batch_X)

        # Step 2: Compute loss for current batch
        batch_loss = loss_fn(y_pred, batch_y)

        # Step 3: Zero gradients from previous iteration
        optimizer.zero_grad()

        # Step 4: Backward pass - compute gradients via automatic differentiation
        batch_loss.backward()

        # Step 5: Update parameters using computed gradients
        optimizer.step()

        # Accumulate batch loss for epoch average
        epoch_train_loss += batch_loss.item()
        num_train_batches += 1

    # Calculate average training loss for epoch
    avg_train_loss = epoch_train_loss / num_train_batches

    ### EVALUATION PHASE ###
    model_0.eval()  # Set model to evaluation mode (disables gradient computation)

    # Initialize epoch test loss accumulator
    epoch_test_loss = 0.0
    num_test_batches = 0

    # Evaluate on test data without gradient computation
    with torch.inference_mode():
        for batch_X, batch_y in test_dataloader:

            # Forward pass on test batch
            test_pred = model_0(batch_X)

            # Compute test loss for current batch
            batch_test_loss = loss_fn(test_pred, batch_y)

            # Accumulate batch loss for epoch average
            epoch_test_loss += batch_test_loss.item()
            num_test_batches += 1

    # Calculate average test loss for epoch
    avg_test_loss = epoch_test_loss / num_test_batches

    # Record metrics and display progress at specified intervals
    if epoch % PRINT_INTERVAL == 0:
        epoch_count.append(epoch)
        train_loss_values.append(avg_train_loss)
        test_loss_values.append(avg_test_loss)

        print(f"Epoch: {epoch:3d} | Train Loss: {avg_train_loss:.6f} | Test Loss: {avg_test_loss:.6f}")

print("=" * 60)
print("Training completed successfully!")
print(f"Final Training Loss: {avg_train_loss:.6f}")
print(f"Final Test Loss: {avg_test_loss:.6f}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Training Progress:
============================================================
Epoch:   0 | Train Loss: 0.310581 | Test Loss: 0.498641
Epoch:  20 | Train Loss: 0.195369 | Test Loss: 0.362761
Epoch:  40 | Train Loss: 0.088470 | Test Loss: 0.232256
Epoch:  60 | Train Loss: 0.053368 | Test Loss: 0.156513
Epoch:  80 | Train Loss: 0.045415 | Test Loss: 0.122476
Epoch: 100 | Train Loss: 0.041541 | Test Loss: 0.106128
Epoch: 120 | Train Loss: 0.038049 | Test Loss: 0.094914
Epoch: 140 | Train Loss: 0.034658 | Test Loss: 0.085780
Epoch: 160 | Train Loss: 0.031305 | Test Loss: 0.077340
Epoch: 180 | Train Loss: 0.027754 | Test Loss: 0.068899
Epoch: 200 | Train Loss: 0.024343 | Test Loss: 0.060112
Epoch: 220 | Train Loss: 0.020869 | Test Loss: 0.051325
Epoch: 240 | Train Loss: 0.017441 | Test Loss: 0.043231
Epoch: 260 | Train Loss: 0.014093 | Test Loss: 0.034790
Epoch: 280 | Train Loss: 0.010688 | Test Loss: 0.026003
Epoch: 300 | Train Loss: 0.007193 | Test Loss: 0.017562
Epoch: 320 | Train Loss: 0.003743 | Test Loss: 0.009491
Epoch: 340 | Train Loss: 0.000469 | Test Loss: 0.001325
============================================================
Training completed successfully!
Final Training Loss: 0.000528
Final Test Loss: 0.000837
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [48]]]
    #v(-6pt)
    ```python
# Plot the loss curves
plt.plot(epoch_count, train_loss_values, label="Train loss")
plt.plot(epoch_count, test_loss_values, label="Test loss")
plt.title("Training and test loss curves")
plt.ylabel("Loss")
plt.xlabel("Epochs")
plt.legend();
    ```
  ]
)


#align(center)[
  #v(4pt)
  #image("images/img_02_3.png", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell 48]
  #v(4pt)
]


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
# Analyze learned parameters compared to ground truth values
print("Parameter Learning Analysis:")
print("=" * 50)

learned_params = model_0.state_dict()
print("Learned Parameters:")
for param_name, param_value in learned_params.items():
    print(f"  {param_name}: {param_value.item():.6f}")

print("\nGround Truth Parameters:")
print(f"  weights: {weight:.6f}")
print(f"  bias: {bias:.6f}")

print("\nParameter Recovery Analysis:")
weight_error = abs(learned_params['weights'].item() - weight)
bias_error = abs(learned_params['bias'].item() - bias)
print(f"  Weight Error: {weight_error:.6f}")
print(f"  Bias Error: {bias_error:.6f}")
print(f"  Total Absolute Error: {weight_error + bias_error:.6f}")

# Assess convergence quality
if weight_error < 0.01 and bias_error < 0.01:
    print("\n✓ Excellent parameter recovery achieved!")
elif weight_error < 0.05 and bias_error < 0.05:
    print("\n✓ Good parameter recovery achieved!")
else:
    print("\n⚠ Parameter recovery may require additional training or hyperparameter tuning.")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Parameter Learning Analysis:
==================================================
Learned Parameters:
  weights: 0.700031
  bias: 0.300808

Ground Truth Parameters:
  weights: 0.700000
  bias: 0.300000

Parameter Recovery Analysis:
  Weight Error: 0.000031
  Bias Error: 0.000808
  Total Absolute Error: 0.000839

✓ Excellent parameter recovery achieved!
    ```
  ]
)


== #strong[\5. Model Evaluation and Inference]
<model-evaluation-and-inference>



=== #strong[5.1 Systematic Approach to Model Evaluation]
<systematic-approach-to-model-evaluation>



#strong[Model evaluation requires adherence to specific protocols to
ensure valid performance assessment.] The following three principles are
essential for proper inference:

==== #strong[5.1.1 Evaluation Protocol Requirements]
<evaluation-protocol-requirements>
+ #strong[Model Mode Configuration];: Set model to evaluation mode using
  `model.eval()`
  - Disables training-specific behaviors (dropout, batch normalization
    updates)
  - Ensures consistent inference behavior across evaluations
+ #strong[Gradient Computation Management];: Use
  `torch.inference_mode()` context manager
  - Disables gradient computation for computational efficiency
  - Prevents accidental parameter updates during evaluation
  - Reduces memory consumption for large-scale inference
+ #strong[Device Consistency];: Ensure model and data reside on the same
  computational device
  - Prevents cross-device tensor operation errors
  - Optimizes computational performance (CPU vs.~GPU placement)

==== #strong[5.1.2 Best Practices for Production Inference]
<best-practices-for-production-inference>
These protocols ensure #strong[reproducible, efficient, and error-free
model evaluation];, which is critical for both research validation and
production deployment scenarios.



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
# Implement proper evaluation protocol for model inference

# Step 1: Configure model for evaluation mode
model_0.eval()
print("Model set to evaluation mode")

# Step 2: Perform inference using proper context management
with torch.inference_mode():
    # Step 3: Ensure device consistency (both model and data on same device)
    # Note: In this example, both model and data are on CPU by default
    # For GPU inference: model_0.to(device) and X_test.to(device)

    y_preds = model_0(X_test)
    print(f"Predictions generated for {len(X_test)} test samples")

# Display inference results
print(f"\nInference Results Summary:")
print(f"Test Set Size: {len(X_test)} samples")
print(f"Predictions Shape: {y_preds.shape}")
print(f"Prediction Range: [{y_preds.min().item():.4f}, {y_preds.max().item():.4f}]")
print(f"Target Range: [{y_test.min().item():.4f}, {y_test.max().item():.4f}]")

# Compute evaluation metrics
with torch.inference_mode():
    test_loss = loss_fn(y_preds, y_test)
    mae = torch.mean(torch.abs(y_preds - y_test))
    mse = torch.mean((y_preds - y_test) ** 2)
    rmse = torch.sqrt(mse)

print(f"\nModel Performance Metrics:")
print(f"Mean Absolute Error (MAE): {mae:.6f}")
print(f"Mean Squared Error (MSE): {mse:.6f}")
print(f"Root Mean Squared Error (RMSE): {rmse:.6f}")
print(f"Test Loss (L1): {test_loss:.6f}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Model set to evaluation mode
Predictions generated for 10 test samples

Inference Results Summary:
Test Set Size: 10 samples
Predictions Shape: torch.Size([10, 1])
Prediction Range: [0.8608, 0.9868]
Target Range: [0.8600, 0.9860]

Model Performance Metrics:
Mean Absolute Error (MAE): 0.000836
Mean Squared Error (MSE): 0.000001
Root Mean Squared Error (RMSE): 0.000836
Test Loss (L1): 0.000836
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [54]]]
    #v(-6pt)
    ```python
plot_predictions(predictions=y_preds)
    ```
  ]
)


#align(center)[
  #v(4pt)
  #image("images/img_02_4.png", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell 54]
  #v(4pt)
]


== #strong[\6. Model Persistence and Reproducibility]
<model-persistence-and-reproducibility>



=== #strong[6.1 Theoretical Foundation of Model Serialization]
<theoretical-foundation-of-model-serialization>



#strong[Model persistence enables reproducible research, model
deployment, and collaborative development.] PyTorch provides multiple
approaches for model serialization, each serving specific use cases in
the machine learning workflow.

==== #strong[6.1.1 PyTorch Serialization Methods]
<pytorch-serialization-methods>
The following table summarizes the primary serialization approaches
available in PyTorch (adapted from the
#link("https://pytorch.org/tutorials/beginner/saving_loading_models.html#saving-loading-model-for-inference")[official PyTorch documentation];):

#figure(
  align(center)[#table(
    columns: (21.82%, 23.64%, 25.45%, 29.09%),
    align: (auto,auto,auto,auto,),
    table.header([#strong[Method];], [#strong[Purpose];], [#strong[Use
      Case];], [#strong[Advantages];],),
    table.hline(),
    [#link("https://pytorch.org/docs/stable/torch.html?highlight=save#torch.save")[`torch.save`];], [Serialize
    Python objects using pickle protocol], [General object
    persistence], [Universal serialization capability],
    [#link("https://pytorch.org/docs/stable/torch.html?highlight=torch%20load#torch.load")[`torch.load`];], [Deserialize
    pickled objects with device specification], [Object restoration and
    loading], [Flexible device placement control],
    [#link("https://pytorch.org/docs/stable/generated/torch.nn.Module.html?highlight=load_state_dict#torch.nn.Module.load_state_dict")[`torch.nn.Module.load_state_dict`];], [Load
    parameter dictionary into model architecture], [Production model
    deployment], [Architecture-independent parameter loading],
  )]
  , kind: table
  )

==== #strong[6.1.2 Best Practices for Model Persistence]
<best-practices-for-model-persistence>
#strong[Recommended Approach];: Save and load `state_dict()` for
production applications - #strong[Flexibility];: Parameters can be
loaded into modified architectures - #strong[Portability];: Reduces
dependencies on specific code versions - #strong[Security];: Minimizes
risks associated with pickle deserialization



=== #strong[6.2 Saving a PyTorch model’s `state_dict()`]
<saving-a-pytorch-models-state_dict>
The
#link("https://pytorch.org/tutorials/beginner/saving_loading_models.html#saving-loading-model-for-inference")[recommended way]
for saving and loading a model for inference (making predictions) is by
saving and loading a model’s `state_dict()`.

Let’s see how we can do that in a few steps:

+ We’ll create a directory for saving models to called `models` using
  Python’s `pathlib` module.
+ We’ll create a file path to save the model to.
+ We’ll call `torch.save(obj, f)` where `obj` is the target model’s
  `state_dict()` and `f` is the filename of where to save the model.

#quote(block: true)[
#strong[Note:] It’s common convention for PyTorch saved models or
objects to end with `.pt` or `.pth`, like `saved_model_01.pth`.
]



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
# Import pathlib for cross-platform file system operations
from pathlib import Path

# Step 1: Create directory structure for model artifacts
MODEL_PATH = Path("models")
MODEL_PATH.mkdir(parents=True, exist_ok=True)
print(f"Model directory created: {MODEL_PATH.absolute()}")

# Step 2: Define model persistence parameters
MODEL_NAME = "01_pytorch_workflow_model_0.pth"
MODEL_SAVE_PATH = MODEL_PATH / MODEL_NAME

# Include metadata in filename for better organization
# Format: [module]_[architecture]_[version]_[date].pth

# Step 3: Serialize model state dictionary
# This approach saves only the learned parameters, not the entire model architecture
print(f"Saving model state dictionary to: {MODEL_SAVE_PATH}")

# Save only the state_dict() containing learned parameters
torch.save(
    obj=model_0.state_dict(),  # Parameter dictionary (weights and biases)
    f=MODEL_SAVE_PATH          # Target file path
)

# Verify successful serialization
if MODEL_SAVE_PATH.exists():
    file_size = MODEL_SAVE_PATH.stat().st_size
    print(f"✓ Model saved successfully")
    print(f"  File size: {file_size} bytes")
    print(f"  Parameters saved: {len(model_0.state_dict())} tensors")
else:
    print("✗ Model saving failed")

# Display saved parameters for verification
print(f"\nSaved Model Parameters:")
saved_state = torch.load(MODEL_SAVE_PATH, weights_only=True)
for param_name, param_value in saved_state.items():
    print(f"  {param_name}: {param_value.item():.6f}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Model directory created: /media/mirl/DATA/Projects/Tutorials/BS_GENAI/models
Saving model state dictionary to: models/01_pytorch_workflow_model_0.pth
✓ Model saved successfully
  File size: 1680 bytes
  Parameters saved: 2 tensors

Saved Model Parameters:
  weights: 0.700031
  bias: 0.300808
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
# Check the saved file path
!ls -l models/01_pytorch_workflow_model_0.pth
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
-rw-rw-r-- 1 mirl mirl 1680 Aug 21 17:43 models/01_pytorch_workflow_model_0.pth
    ```
  ]
)


=== #strong[6.3 Loading a saved PyTorch model’s `state_dict()`]
<loading-a-saved-pytorch-models-state_dict>
Since we’ve now got a saved model `state_dict()` at
`models/01_pytorch_workflow_model_0.pth` we can now load it in using
`torch.nn.Module.load_state_dict(torch.load(f))` where `f` is the
filepath of our saved model `state_dict()`.

Why call `torch.load()` inside `torch.nn.Module.load_state_dict()`?

Because we only saved the model’s `state_dict()` which is a dictionary
of learned parameters and not the #emph[entire] model, we first have to
load the `state_dict()` with `torch.load()` and then pass that
`state_dict()` to a new instance of our model (which is a subclass of
`nn.Module`).

#strong[Why not save the entire model?]

#quote(block: true)[
The disadvantage of this approach #emph[(saving the whole model)] is
that the serialized data is bound to the specific classes and the exact
directory structure used when the model is saved…

Because of this, your code can break in various ways when used in other
projects or after refactors.
]



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
# Demonstrate model restoration from saved state dictionary

# Step 1: Instantiate new model with random initialization
# This simulates loading a model in a new session or environment
loaded_model_0 = LinearRegressionModel()

print("Model Loading Process:")
print("=" * 40)

# Display initial random parameters
print("Initial Random Parameters:")
initial_state = loaded_model_0.state_dict()
for param_name, param_value in initial_state.items():
    print(f"  {param_name}: {param_value.item():.6f}")

# Step 2: Load saved state dictionary into model
# The weights_only=True parameter enhances security by preventing code execution
loaded_state_dict = torch.load(f=MODEL_SAVE_PATH, weights_only=True)
loaded_model_0.load_state_dict(loaded_state_dict)

print("\nParameters After Loading:")
restored_state = loaded_model_0.state_dict()
for param_name, param_value in restored_state.items():
    print(f"  {param_name}: {param_value.item():.6f}")

# Step 3: Verify parameter restoration accuracy
print("\nParameter Restoration Verification:")
original_state = model_0.state_dict()
restoration_success = True

for param_name in original_state.keys():
    original_val = original_state[param_name].item()
    restored_val = restored_state[param_name].item()
    difference = abs(original_val - restored_val)

    print(f"  {param_name}:")
    print(f"    Original: {original_val:.8f}")
    print(f"    Restored: {restored_val:.8f}")
    print(f"    Difference: {difference:.2e}")

    if difference > 1e-6:  # Tolerance for floating-point precision
        restoration_success = False

if restoration_success:
    print("\n✓ Perfect parameter restoration achieved!")
else:
    print("\n⚠ Parameter restoration discrepancies detected")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Model Loading Process:
========================================
Initial Random Parameters:
  weights: -0.599253
  bias: 0.501907

Parameters After Loading:
  weights: 0.700031
  bias: 0.300808

Parameter Restoration Verification:
  weights:
    Original: 0.70003080
    Restored: 0.70003080
    Difference: 0.00e+00
  bias:
    Original: 0.30080846
    Restored: 0.30080846
    Difference: 0.00e+00

✓ Perfect parameter restoration achieved!
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
# 1. Put the loaded model into evaluation mode
loaded_model_0.eval()

# 2. Use the inference mode context manager to make predictions
with torch.inference_mode():
    loaded_model_preds = loaded_model_0(X_test) # perform a forward pass on the test data with the loaded model
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
# Validate loaded model through prediction comparison

# Generate predictions using loaded model with proper evaluation protocol
loaded_model_0.eval()
with torch.inference_mode():
    loaded_model_preds = loaded_model_0(X_test)

# Compare predictions between original and loaded models
prediction_comparison = torch.allclose(y_preds, loaded_model_preds, atol=1e-6)

print("Model Validation Results:")
print("=" * 35)
print(f"Prediction Comparison: {'✓ PASS' if prediction_comparison else '✗ FAIL'}")

# Detailed comparison statistics
pred_differences = torch.abs(y_preds - loaded_model_preds)
max_difference = torch.max(pred_differences).item()
mean_difference = torch.mean(pred_differences).item()

print(f"Maximum Prediction Difference: {max_difference:.2e}")
print(f"Mean Prediction Difference: {mean_difference:.2e}")

# Evaluate loaded model performance
with torch.inference_mode():
    loaded_test_loss = loss_fn(loaded_model_preds, y_test)
    original_test_loss = loss_fn(y_preds, y_test)

print(f"\nPerformance Comparison:")
print(f"Original Model Loss: {original_test_loss:.8f}")
print(f"Loaded Model Loss: {loaded_test_loss:.8f}")
print(f"Loss Difference: {abs(original_test_loss - loaded_test_loss):.2e}")

if prediction_comparison and abs(original_test_loss - loaded_test_loss) < 1e-6:
    print("\n✓ Model loading and restoration verified successfully!")
    print("  The loaded model maintains identical performance to the original.")
else:
    print("\n⚠ Model restoration validation failed!")
    print("  Manual investigation required.")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Model Validation Results:
===================================
Prediction Comparison: ✓ PASS
Maximum Prediction Difference: 0.00e+00
Mean Prediction Difference: 0.00e+00

Performance Comparison:
Original Model Loss: 0.00083589
Loaded Model Loss: 0.00083589
Loss Difference: 0.00e+00

✓ Model loading and restoration verified successfully!
  The loaded model maintains identical performance to the original.
    ```
  ]
)


== #strong[\7. Complete Workflow Integration: Advanced Implementation]
<complete-workflow-integration-advanced-implementation>



=== #strong[7.1 Production-Ready Implementation]
<production-ready-implementation>
#strong[This section demonstrates the complete PyTorch workflow using
advanced techniques suitable for production environments.] The
implementation incorporates:

+ #strong[Device-agnostic code] for CPU/GPU compatibility
+ #strong[Enhanced model architecture] using PyTorch’s built-in layers
+ #strong[Comprehensive training protocols] with proper monitoring
+ #strong[Professional model management] practices

==== #strong[7.1.1 Learning Outcomes]
<learning-outcomes>
Upon completion of this section, students will understand: - GPU
acceleration and device management strategies - Advanced PyTorch layer
implementations (`nn.Linear`) - Scalable training loop architectures -
Professional model versioning and deployment practices

#quote(block: true)[
#strong[Note];: For Google Colab users, GPU acceleration can be enabled
via Runtime → Change runtime type → Hardware accelerator → GPU. Note
that this will restart the runtime environment.
]



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
# Import PyTorch and matplotlib
import torch
from torch import nn # nn contains all of PyTorch's building blocks for neural networks
import matplotlib.pyplot as plt

# Check PyTorch version
torch.__version__
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
'2.4.1+cu121'
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [68]]]
    #v(-6pt)
    ```python
# Configure device-agnostic computation for optimal performance
# This enables automatic GPU utilization when available, with CPU fallback

device = "cuda" if torch.cuda.is_available() else "cpu"
print(f"Computational Device Configuration:")
print(f"Selected Device: {device}")

if torch.cuda.is_available():
    print(f"GPU Device Name: {torch.cuda.get_device_name(0)}")
    print(f"GPU Memory Available: {torch.cuda.get_device_properties(0).total_memory / 1e9:.1f} GB")
    print(f"CUDA Version: {torch.version.cuda}")
else:
    print("GPU not available - using CPU for computation")
    print("Note: GPU acceleration significantly improves training speed for large models")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Computational Device Configuration:
Selected Device: cuda
GPU Device Name: NVIDIA GeForce RTX 3090
GPU Memory Available: 25.4 GB
CUDA Version: 12.1
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [69]]]
    #v(-6pt)
    ```python
# Create weight and bias
weight = 0.7
bias = 0.3

# Create range values
start = 0
end = 1
step = 0.02

# Create X and y (features and labels)
X = torch.arange(start, end, step).unsqueeze(dim=1) # without unsqueeze, errors will happen later on (shapes within linear layers)
y = weight * X + bias
X[:10], y[:10]
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(tensor([[0.0000],
         [0.0200],
         [0.0400],
         [0.0600],
         [0.0800],
         [0.1000],
         [0.1200],
         [0.1400],
         [0.1600],
         [0.1800]]),
 tensor([[0.3000],
         [0.3140],
         [0.3280],
         [0.3420],
         [0.3560],
         [0.3700],
         [0.3840],
         [0.3980],
         [0.4120],
         [0.4260]]))
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [70]]]
    #v(-6pt)
    ```python
# Split data
train_split = int(0.8 * len(X))
X_train, y_train = X[:train_split], y[:train_split]
X_test, y_test = X[train_split:], y[train_split:]

len(X_train), len(y_train), len(X_test), len(y_test)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
(40, 40, 10, 10)
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [71]]]
    #v(-6pt)
    ```python
# Note: If you've reset your runtime, this function won't work,
# you'll have to rerun the cell above where it's instantiated.
plot_predictions(X_train.detach().cpu(), y_train.detach().cpu(), X_test.detach().cpu(), y_test.detach().cpu())
    ```
  ]
)


#align(center)[
  #v(4pt)
  #image("images/img_02_5.png", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell 71]
  #v(4pt)
]


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
# Advanced Linear Regression Model using PyTorch's optimized layers
class LinearRegressionModelV2(nn.Module):
    """
    Enhanced Linear Regression Model using PyTorch's optimized nn.Linear layer.

    This implementation leverages PyTorch's built-in linear transformation layer,
    which provides:
    - Optimized matrix operations for improved computational efficiency
    - Automatic parameter initialization using industry-standard methods
    - Built-in support for bias terms and various initialization strategies
    - Seamless integration with advanced optimization algorithms

    Architecture Specifications:
    - Input Features: 1 (univariate regression)
    - Output Features: 1 (single continuous prediction)
    - Parameters: 2 (weight matrix W ∈ ℝ¹ˣ¹, bias vector b ∈ ℝ¹)
    - Computational Complexity: O(1) per forward pass
    """

    def __init__(self):
        """
        Initialize model architecture with optimized linear layer.

        The nn.Linear layer implements the transformation y = xW^T + b
        where W is automatically initialized using Kaiming uniform distribution
        and b is initialized to zero by default.
        """
        super().__init__()

        # Implement linear transformation using PyTorch's optimized layer
        self.linear_layer = nn.Linear(
            in_features=1,   # Input dimensionality (single feature)
            out_features=1   # Output dimensionality (single prediction)
        )

        # Optional: Custom parameter initialization
        # nn.init.normal_(self.linear_layer.weight, mean=0.0, std=0.1)
        # nn.init.zeros_(self.linear_layer.bias)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """
        Execute forward pass through linear transformation.

        Parameters:
        -----------
        x : torch.Tensor
            Input tensor with shape [batch_size, in_features]

        Returns:
        --------
        torch.Tensor
            Output predictions with shape [batch_size, out_features]
        """
        # Apply linear transformation: y = xW^T + b
        return self.linear_layer(x)

# Initialize enhanced model with reproducible random seed
torch.manual_seed(42)
model_1 = LinearRegressionModelV2()

print("Enhanced Model Architecture:")
print("=" * 40)
print(f"Model: {model_1}")
print(f"\nModel Parameters:")
for name, param in model_1.named_parameters():
    print(f"  {name}: {param.shape} | Values: {param.data.flatten()}")

print(f"\nTotal Parameters: {sum(p.numel() for p in model_1.parameters())}")
print(f"Trainable Parameters: {sum(p.numel() for p in model_1.parameters() if p.requires_grad)}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Enhanced Model Architecture:
========================================
Model: LinearRegressionModelV2(
  (linear_layer): Linear(in_features=1, out_features=1, bias=True)
)

Model Parameters:
  linear_layer.weight: torch.Size([1, 1]) | Values: tensor([0.2259])
  linear_layer.bias: torch.Size([1]) | Values: tensor([0.9754])

Total Parameters: 2
Trainable Parameters: 2
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [73]]]
    #v(-6pt)
    ```python
# Check model device
next(model_1.parameters()).device
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
device(type='cuda', index=0)
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [74]]]
    #v(-6pt)
    ```python
# Set model to GPU if it's available, otherwise it'll default to CPU
model_1.to(device) # the device variable was set above to be "cuda" if available or "cpu" if not
next(model_1.parameters()).device
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
device(type='cuda', index=0)
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
# Create loss function
loss_fn = nn.L1Loss()

# Create optimizer
optimizer = torch.optim.SGD(params=model_1.parameters(), # optimize newly created model's parameters
                            lr=0.001)
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [76]]]
    #v(-6pt)
    ```python
# Configure reproducible training environment
torch.manual_seed(42)

# Training hyperparameters for production-ready implementation
EPOCHS = 500
LEARNING_RATE = 0.01
PRINT_INTERVAL = 50

print("Production Training Configuration:")
print("=" * 50)
print(f"Device: {device}")
print(f"Epochs: {EPOCHS}")
print(f"Learning Rate: {LEARNING_RATE}")
print(f"Batch Size: {BATCH_SIZE}")
print(f"Model Architecture: {model_1.__class__.__name__}")

# Transfer model to optimal computational device
model_1.to(device)
print(f"Model transferred to: {next(model_1.parameters()).device}")

# Transfer data tensors to match model device
X_train = X_train.to(device)
X_test = X_test.to(device)
y_train = y_train.to(device)
y_test = y_test.to(device)

print(f"Data transferred to: {X_train.device}")

# Configure optimization components
loss_fn = nn.L1Loss()
optimizer = torch.optim.SGD(params=model_1.parameters(), lr=LEARNING_RATE)

# Initialize performance tracking
train_losses = []
test_losses = []
best_test_loss = float('inf')
best_epoch = 0

print(f"\nTraining Progress:")
print("=" * 70)
print(f"{'Epoch':>6} | {'Train Loss':>12} | {'Test Loss':>12} | {'Best Test':>12}")
print("-" * 70)

# Execute comprehensive training loop
for epoch in range(EPOCHS):

    ### TRAINING PHASE ###
    model_1.train()

    # Forward pass with current parameters
    y_pred = model_1(X_train)

    # Compute training loss
    train_loss = loss_fn(y_pred, y_train)

    # Optimize parameters via gradient descent
    optimizer.zero_grad()  # Clear accumulated gradients
    train_loss.backward()  # Compute gradients via backpropagation
    optimizer.step()       # Update parameters

    ### EVALUATION PHASE ###
    model_1.eval()

    with torch.inference_mode():
        # Generate test predictions
        test_pred = model_1(X_test)

        # Compute test loss for generalization assessment
        test_loss = loss_fn(test_pred, y_test)

        # Track best performing model
        if test_loss < best_test_loss:
            best_test_loss = test_loss
            best_epoch = epoch

    # Record metrics for analysis
    train_losses.append(train_loss.item())
    test_losses.append(test_loss.item())

    # Display progress at specified intervals
    if epoch % PRINT_INTERVAL == 0:
        print(f"{epoch:6d} | {train_loss.item():12.8f} | {test_loss.item():12.8f} | {best_test_loss.item():12.8f}")

print("-" * 70)
print(f"Training completed successfully!")
print(f"Best Test Loss: {best_test_loss:.8f} (Epoch {best_epoch})")
print(f"Final Train Loss: {train_losses[-1]:.8f}")
print(f"Final Test Loss: {test_losses[-1]:.8f}")

# Assess convergence quality
improvement_ratio = (train_losses[0] - train_losses[-1]) / train_losses[0] * 100
print(f"Training Loss Improvement: {improvement_ratio:.2f}%")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Production Training Configuration:
==================================================
Device: cuda
Epochs: 500
Learning Rate: 0.01
Batch Size: 8
Model Architecture: LinearRegressionModelV2
Model transferred to: cuda:0
Data transferred to: cuda:0

Training Progress:
======================================================================
 Epoch |   Train Loss |    Test Loss |    Best Test
----------------------------------------------------------------------
     0 |   0.49054596 |   0.24003486 |   0.24003486
    50 |   0.12680577 |   0.22968142 |   0.02740902
   100 |   0.10459737 |   0.24045961 |   0.02740902
   150 |   0.08734278 |   0.20321877 |   0.02740902
   200 |   0.07017435 |   0.16322982 |   0.02740902
   250 |   0.05300468 |   0.12324089 |   0.02740902
   300 |   0.03582926 |   0.08325197 |   0.02740902
   350 |   0.01865626 |   0.04257615 |   0.02740902
   400 |   0.00148978 |   0.00190925 |   0.00190925
   450 |   0.00253267 |   0.00840883 |   0.00190925
----------------------------------------------------------------------
Training completed successfully!
Best Test Loss: 0.00190925 (Epoch 400)
Final Train Loss: 0.00898831
Final Test Loss: 0.00506216
Training Loss Improvement: 98.17%
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [77]]]
    #v(-6pt)
    ```python
# Find our model's learned parameters
from pprint import pprint # pprint = pretty print, see: https://docs.python.org/3/library/pprint.html
print("The model learned the following values for weights and bias:")
pprint(model_1.state_dict())
print("\nAnd the original values for weights and bias are:")
print(f"weights: {weight}, bias: {bias}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
The model learned the following values for weights and bias:
OrderedDict([('linear_layer.weight', tensor([[0.6949]])),
             ('linear_layer.bias', tensor([0.2994]))])

And the original values for weights and bias are:
weights: 0.7, bias: 0.3
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [78]]]
    #v(-6pt)
    ```python
# Turn model into evaluation mode
model_1.eval()

# Make predictions on the test data
with torch.inference_mode():
    y_preds = model_1(X_test)
y_preds
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[0.8554],
        [0.8693],
        [0.8832],
        [0.8971],
        [0.9110],
        [0.9249],
        [0.9388],
        [0.9527],
        [0.9666],
        [0.9805]])
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [79]]]
    #v(-6pt)
    ```python
# plot_predictions(predictions=y_preds) # -> won't work... data not on CPU

# Put data on the CPU and plot it
plot_predictions(predictions=y_preds.cpu())
    ```
  ]
)


#align(center)[
  #v(4pt)
  #image("images/img_02_6.png", width: 85%)
  #v(2pt)
  #text(size: 7.5pt, fill: rgb("#718096"), style: "italic")[Figure: Output plot generated from Cell 79]
  #v(4pt)
]


#v(4pt)
#block(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e0"),
  radius: 3pt,
  fill: rgb("#f8fafc"),
  inset: 7pt,
  [
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [80]]]
    #v(-6pt)
    ```python
from pathlib import Path

# 1. Create models directory
MODEL_PATH = Path("models")
MODEL_PATH.mkdir(parents=True, exist_ok=True)

# 2. Create model save path
MODEL_NAME = "01_pytorch_workflow_model_1.pth"
MODEL_SAVE_PATH = MODEL_PATH / MODEL_NAME

# 3. Save the model state dict
print(f"Saving model to: {MODEL_SAVE_PATH}")
torch.save(obj=model_1.state_dict(), # only saving the state_dict() only saves the models learned parameters
           f=MODEL_SAVE_PATH)
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Saving model to: models/01_pytorch_workflow_model_1.pth
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [81]]]
    #v(-6pt)
    ```python
# Instantiate a fresh instance of LinearRegressionModelV2
loaded_model_1 = LinearRegressionModelV2()

# Load model state dict
loaded_model_1.load_state_dict(torch.load(MODEL_SAVE_PATH, weights_only=True))

# Put model to target device (if your data is on GPU, model will have to be on GPU to make predictions)
loaded_model_1.to(device)

print(f"Loaded model:\n{loaded_model_1}")
print(f"Model on device:\n{next(loaded_model_1.parameters()).device}")
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
Loaded model:
LinearRegressionModelV2(
  (linear_layer): Linear(in_features=1, out_features=1, bias=True)
)
Model on device:
cuda:0
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
    #align(right)[#text(size: 6.5pt, fill: rgb("#718096"), weight: "bold")[PYTHON IN [82]]]
    #v(-6pt)
    ```python
# Evaluate loaded model
loaded_model_1.eval()
with torch.inference_mode():
    loaded_model_1_preds = loaded_model_1(X_test)
y_preds == loaded_model_1_preds
    ```
  ]
)


#block(
  width: 100%,
  stroke: (left: 2.5pt + rgb("22543d")),
  fill: rgb("#f1f5f9"),
  inset: (x: 7pt, y: 5pt),
  radius: (right: 3pt),
  [
    #text(size: 6.5pt, fill: rgb("#64748b"), weight: "bold")[OUTPUT]
    #v(-4pt)
    ```
tensor([[True],
        [True],
        [True],
        [True],
        [True],
        [True],
        [True],
        [True],
        [True],
        [True]])
    ```
  ]
)


== #strong[\8. Summary and Conclusion]
<summary-and-conclusion>



=== #strong[8.1 Key Learning Outcomes]
<key-learning-outcomes>
This comprehensive tutorial has demonstrated the complete PyTorch
workflow for machine learning model development. Students have
successfully learned to:

==== #strong[8.1.1 Technical Competencies Acquired]
<technical-competencies-acquired>
- #strong[Data Management];: Implemented systematic data preparation,
  partitioning, and efficient loading using DataLoader
- #strong[Model Architecture];: Designed and implemented neural network
  models using both custom and built-in PyTorch components
- #strong[Training Protocols];: Executed proper training loops with
  gradient descent optimization and evaluation procedures
- #strong[Custom Components];: Created custom loss functions for
  specialized learning objectives
- #strong[Model Persistence];: Managed model saving, loading, and
  validation for reproducible research

==== #strong[8.1.2 Methodological Understanding]
<methodological-understanding>
- #strong[Scientific Rigor];: Applied proper experimental design with
  controlled parameters and systematic evaluation
- #strong[Performance Assessment];: Utilized appropriate metrics and
  visualization techniques for model analysis
- #strong[Best Practices];: Implemented production-ready code with
  device management and error handling
- #strong[Reproducibility];: Ensured consistent results through proper
  random seed management and documentation

=== #strong[8.2 Workflow Generalization]
<workflow-generalization>
#strong[The methodological framework presented in this tutorial applies
broadly across machine learning domains:]

#figure(
  align(center)[#table(
    columns: (32.35%, 35.29%, 32.35%),
    align: (auto,auto,auto,),
    table.header([#strong[Application Domain];], [#strong[Workflow
      Adaptation];], [#strong[Key Considerations];],),
    table.hline(),
    [#strong[Computer Vision];], [Replace linear layers with
    convolutional architectures], [Image preprocessing, data
    augmentation, GPU memory management],
    [#strong[Natural Language Processing];], [Implement sequential
    models (RNN, Transformer)], [Tokenization, sequence padding,
    attention mechanisms],
    [#strong[Time Series Analysis];], [Add temporal modeling
    components], [Sequential dependencies, feature engineering,
    forecasting horizons],
    [#strong[Reinforcement Learning];], [Integrate policy/value function
    optimization], [Action spaces, reward design, exploration
    strategies],
  )]
  , kind: table
  )

