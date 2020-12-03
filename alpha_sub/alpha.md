Type Assistance for Graphics System (T.A.G.S.):
Within computer graphics there are a number of subtle and difficult to solve bugs when doing vector calculations. An example of this is transforming a vector from one reference to another, such as from “Model” to “View” for getting representations of objects in 3D space.

My goal is to create a type system which forces correct transformations between 3D spaces (Such as World, Object, and Model spaces). My current idea is to use a Tag system to annotate vectors or other elements. Each tag would consist of a name space such as coordinate system or space, and a corresponding value. For example a Vector annotated with the tag (“coordinate system”, “cartesian”).

The type checker will then make sure that for every operation the Tags must match. For example a value with a cartesian tag could not be added with one with a spherical coordinate system tag.

Eventually my goal is to implement a function system as well, which would let functions be annotated to describe transitions between tags.
