PART A: Explanation-Based Questions (15 marks). Why is ERD or Normalization important? Compare and contrast 1NF, 2NF, and 3NF. Explain the bridge table and it's use. What is the difference between weak and strong relationship? Compare unary, binary, and ternary relationship.

# Why is ERD or Normalization important? (3 marks)
- ERD (Entity-Relationship Diagram) is important because it `visually shows how data is organized` (`entities, attributes, and relationships`), **helping design an efficient database and avoid errors**.
- Normalization is key to `remove duplicate data and unwanted dependencies`, ensuring **data stays accurate and consistent** while improving performance during inserts, updates, and deletes.

# Compare and contrast 1NF, 2NF, and 3NF. (3 marks)
- 1NF (First Normal Form): Ensures all data is `atomic` (`no repeating groups or multi-values`) and `has primary key`. It may still have partial dependencies.
- 2NF (Second Normal Form): **Builds on 1NF** by `removing partial dependencies`, requiring all **non-key attributes to depend on the entire primary key** (applies to tables with composite keys).
- 3NF (Third Normal Form): **Extends 2NF** by `eliminating transitive dependencies`, ensuring **non-key attributes depend only on the primary key**.
- Contrast: `1NF focuses on atomic data, 2NF fixes partial dependencies, and 3NF removes transitive dependencies`, `reducing redundancy step-by-step`.

# Explain the bridge table and its use. (3 marks)
- used to `connect two tables in a many-to-many relationship`.
- It holds the `primary keys of both related tables as foreign keys`.
- It helps `break down many-to-many into two one-to-many` relationships

# What is the difference between weak and strong relationship? (3 marks)
- strong relationship (identifying) occurs when a `child entity’s primary key includes the parent’s primary key`. It uses a `solid line` in ERD.
- weak relationship (non-identifying) happens when the `child has its own primary key` and `references the parent via a foreign key`. It uses a `dashed line` in ERD.

# Compare unary, binary, and ternary relationship. (3 marks)
- Unary Relationship: `Involves one entity, self-referential` 
Binary Relationship: `Involves two entities` 
Ternary Relationship: `Involves three entities`

PART B: Entity Relationship Modeling (10 marks)

Design an ERD (Crow’s Foot Notation) for the following problem:

PART C: Database Normalization (10 marks)
-----------------------------