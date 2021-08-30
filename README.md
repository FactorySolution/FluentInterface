
# Intent

A fluent interface provides an easy-readable, flowing interface, that often mimics a domain specific language. Using this pattern results in code that can be read nearly as human language.

# Explanation

The Fluent Interface pattern is useful when you want to provide an easy readable, flowing API. Those interfaces tend to mimic domain specific languages, so they can nearly be read as human languages.

A fluent interface can be implemented using any of

* Method chaining - calling a method returns some object on which further methods can be called.
* Static factory methods and imports.
* Named parameters - can be simulated using static factory methods.

Real world example

> We need to select numbers based on different criteria from the list. It's a great chance to utilize fluent interface pattern to provide readable easy-to-use developer experience.

# In plain words

> Fluent Interface pattern provides easily readable flowing interface to code.

# Wikipedia says

> In software engineering, a fluent interface is an object-oriented API whose design relies extensively on method chaining. Its goal is to increase code legibility by creating a domain-specific language (DSL).

# Class diagram (Java)

![fluentinterface](https://user-images.githubusercontent.com/4579187/131413751-8838361e-94f2-41e5-95e6-52bf9d0baa3d.png)

# Applicability
Use the Fluent Interface pattern when

* You provide an API that would benefit from a DSL-like usage.
* You have objects that are difficult to configure or use.

# Credits
* [ Fluent Interface - Martin Fowler](https://www.martinfowler.com/bliki/FluentInterface.html)
* [ Evolutionary architecture and emergent design: Fluent interfaces - Neal Ford](http://www.ibm.com/developerworks/library/j-eaed14/)
* [ Internal DSL](https://www.infoq.com/articles/internal-dsls-java/)
* [ Domain Specific Languages](https://www.amazon.com/gp/product/0321712943/ref=as_li_tl?ie=UTF8&tag=javadesignpat-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0321712943&linkId=ad8351d6f5be7d8b7ecdb650731f85df)
