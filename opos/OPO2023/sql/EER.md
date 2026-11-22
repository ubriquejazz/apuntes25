# Extended Entity-Relation Modeling

EER is a high-level data model that incorporates the  extensions to the original ER model. Enhanced ERD are high level models  that represent the requirements and complexities of complex database.

In addition to ER model concepts EE-R includes −

- Subclasses and Super classes.
- Specialization and Generalization.
- Category or union type.
- Aggregation.

These concepts are used to create EE-R diagrams.

## Subclasses and Super class

Super class is an entity that can be divided into further subtype.

For **example** − consider Shape super class.

![img](https://www.tutorialspoint.com/assets/questions/images/107556-1532408353.png)

Super class shape has sub groups: Triangle, Square and Circle.

Sub classes are the group of entities with some unique attributes.Sub class inherits the properties and attributes from super class.

## Specialization and Generalization

Generalization is a process of generalizing an entity which contains generalized  attributes or properties of generalized entities.

![img](https://www.tutorialspoint.com/assets/questions/images/113346-1532408376.png)

It is a Bottom up process i.e. consider we have 3 sub entities Car, Truck  and Motorcycle. Now these three entities can be generalized into one  super class named as Vehicle.

Specialization is a process of  identifying subsets of an entity that share some different  characteristic. It is a top down approach in which one entity is broken  down into low level entity.

In above example Vehicle entity can be a Car, Truck or Motorcycle.

## Category or Union

Relationship of one super or sub class with more than one super class.

![img](https://www.tutorialspoint.com/assets/questions/images/98917-1532408462.png)

Owner is the subset of two super class: Vehicle and House.

## Aggregation

Represents relationship between a whole object and its component.

![img](https://www.tutorialspoint.com/assets/questions/images/133279-1533047715.png)

Consider a ternary relationship Works_On between Employee, Branch and Manager.  Now the best way to model this situation is to use aggregation, So, the  relationship-set, Works_On is a higher level entity-set. Such an  entity-set is treated in the same manner as any other entity-set. We can create a binary relationship, Manager, between Works_On and Manager to  represent who manages what tasks.