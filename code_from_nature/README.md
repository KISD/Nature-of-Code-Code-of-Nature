# CODE FROM NATURE

_Agustina Andreoletti_


<!-- <div class="example_links">
<a href="" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory1CA.jpg"></a>
<a href="" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory2fractal.jpg"></a>
<a href="" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory3agents.jpg"></a>
<a href="" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory4ecosystem.jpg"></a>
<a href="" style="float: left; width: 18%; border: 1px solid gray"><img src="assets/theory5evosystem.jpg"></a>
<div style="clear:both;"></div>
</div> -->


Natural systems are typically characterized by a great degree of complexity. This complexity means that the behavior of natural systems may appear unpredictable and imprecise, but at the same time living organisms, and the ecosystems in which they are found, show a substantial degree of resilience.

Many aspects found on nature can contribute positively to the improvement in the design of computer software and hardware. However, centralized programming contrasts strongly with these situation in the natural world. Natural systems provide many examples of flexibility and adaptability required by computer systems, to cope with the changing demands placed upon them over time.

## Nature-inspired computing systems
The properties and methods found in nature can be translated into rules, representing ways of practical application in programming and design.  Nature-inspired computing can draw inspiration from many different areas of living systems including cell phenomena, development, fractals, behavior, evolution and ecology.

### Cellular automaton

<a href="https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory1CA" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory1CA.jpg"></a> [Cellular Example](https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory1CA)

Cellular automaton is a discreet complex dynamic system. It consists of cells arranged in a spatial grid structure. Each cell is in one of the finite number of states, which determine local rules. The state of a cell depends on its previous state and the previous state of the cells in its immediate, broader or narrower environment neighborhood. New states of the cells are established in discreet time intervals, and thus it comes to the evolution of the system. The system is self-organized and it reproduces itself.

Complex living organisms, such as humans, develop from very simple single-cell origins into complicated multicellular creatures . This process of development is analogous to the process of evolutionary change that has produced current life on earth. Development is in many ways a very appropriate source of computational algorithms, because it incorporates flexibility along with stability, while providing the means to generate complex structures.

Development has been used in a variety of computational applications. The first use was taken from the process found in the development of the abdominal bristles of the fruit fly Drosophila, which gave inspiration to the possibility of allocate channels for a cellular telecommunications network. The arrangement of bristles on the abdomen of the fruit fly is such that not every cell on its back can generate a bristle, because there is not enough space. Instead cells that develop bristles inhibit the further development of neighboring cells, and out of these local interactions the appropriate pattern of bristles is generated. This pattern of inhibition of neighboring cells was appropriated to prevent interference in mobile telephone networks, and is currently being developed for application to real-world mobile networks.

![image](ca1.jpg)

*Neural differentiation in Drosophila. (A and B) The adult fly showing the evenly spaced bristles on the back (bristle positions have been marked with dots in the right half of B). (C) A schematic of the process of selecting the cells which will make bristles. All cells are initially equivalent, some acquire bristle potential and some of these realize that potential by inhibiting their neighbors. (D and E) Tissue from the developing fly stained to reveal cells with bristle potential. Many cells initially stain (D) but at a slightly later time only a few cells retain bristle potential (E) (B, D and E taken from Tateson 1998)*

![image](ca2.jpg)

*Panel A is a map of a 58 cell mobile phone network in East Anglia, UK (redrawn from Lochtie and Mehler 1995). Panels B to D show channel usage and corresponding solutions at progressively later stages of optimization. In each case the upper half of the panel shows the simulated, partial usage of each of 29 channels in each of the 58 cells of the network (the darker the dot, the higher the usage). The lower panel shows the solution which is extracted from this simulated usage. The solution is ‘black and white’ – a channel is either used (black) or not (white). Initially simulated usage is homogeneous and the solution is random (B). As time goes on the simulated usage becomes more heterogeneous and the extracted solution can be seen to be drawn from the simulated usage with few ambiguities (D).*

### Fractal

<a href="https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory2fractal" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory2fractal.jpg"></a>
[Fractal Example](https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory2fractal)

Fractal is a complex, hierarchically ordered structure which establishes self-similarity through different scales. The notion of self-similarity is understood as the parts reflecting a whole, that being linear and non-linear self-similarity or self-affinity.

However, such mathematically defined fractal comprises mathematically precisely defined similarity of its parts with a whole and as such it does not appear in nature. In fractals in nature, close-similarity or related-similarity appears as parts of a whole. Taking a tree as example, it is noticeable that the tree, big branches and small branches and twigs have all a similar form. But this similarity with a whole tree it is not complete, all modules have the same structure “essence” which reminds the form of the original tree, although they do not replicate the exactly form of the center or contiguous modules.

Different applications can be found in computer science, such as image and music generation, data compression and simulations. Data compression assumes that the data has a lot of similar parts, and uses this concept to write only one of those parts characteristics to then be used to recover the others.

A widely used application is the fractal antenna. The fractal antenna instead of being cut to specific length for a specific frequency can operate on multiple frequencies at once or even over a wide spectrum of frequencies. Their small size and accessibility paved their way into many applications like cell phones and in cars where one very small fractal antenna can serve several telecommunication services.

[Free Patents online](http://www.freepatentsonline.com/7123208.pdf)

*The design of the Multilevel antennae is such that it provides two important advantages: the antenna may operate simultaneously in several frequencies, and/or its size can be substantially reduced. Thus, a multiband radioelectric behaviour is achieved, that is, a similar behavior for different frequency bands.*

### Agents and crowd theory

<a href="https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory3agents" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory3agents.jpg"></a> [Agents Example](https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory3agents)

Аgents and crowd theory was initiated with the development of technology and is based on the principle of the agents capable of independent actions and learning. Examples in the nature can be the colony of ants or flock of birds.

The model of an agent as a self-organized model represents a model with an idea of crowd theory. The crowd theory represents collective movement of a great number of autonomous entities. Whereas from the viewpoint of the mathematical model, it is a phenomenal behavior which ensues from simple rules according to which the individuals behave, and do not include any central coordination. These models are known under the term of agents or multi-agents. They start with rules for behavior and tend to generate, through computer simulations of these rules, patterns of these behaviors, assigning a set of rules according to which each element behave and resulting into a possible solution. This principle represents a bottom-up system according to which the outcome develops, from the local rule towards the general one.

The agents in great number behave according to the same rules with different input data which results in the creation of a unique whole. Each unit of the whole is a sub-unit by itself, but since great number of units make an inseparable whole, they maintain their individuality but form a whole unit at the same time.

The implementation of behavior in software has been one of the aims of nature-inspired computing since its origin, but especially since the development of the field of artificial intelligence. One of the features of living systems, that artificial life seeks to recreate, is the dynamic interaction and movement of many entities. In pursuit of these aims researchers developed such systems as “boids”, a self-organizing software system which simulates the flocking behavior of birds. “Information flocking” uses similar ideas, but links individual entities to information in a database. From different groups of individuals representing clusters of information, users of the system can get a rapid and intuitive view of associations among the data. This system is a useful addition to the data mining tools that are required to understand the mass of data in current telecommunications and computing systems.

Software agents are software entities that carry out activities to some degree autonomously from human management. However, they can interact with other agents, react to external events, have some degree of proactivity, and modify their behavior in anticipation of external events. Some authors and investigators consider software agents as a sub-class of autonomous agents, a category that includes robots.

![Agents](agents.jpg "Optional title")

*Collective problem solving by ants: (A) Some ants are walking on a path between start and end point. (B) An obstacle suddenly appears and the ants must get around it. More pheromones are deposited per unit of time on the right path than on the left path. (C) At a steady state, the ants follow the shortest path.*

### Ecological systems

<a href="https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory4ecosystem" style="float:left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory4ecosystem.jpg"></a> [Ecological Example](https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory4ecosystem)

Living organisms exist in network of interactions with other organisms. The form of these interactions is very familiar from everyday life; including feeding, cooperation and competition. Similarly, computing and telecommunications technology are typically organized into networks, with different types of interaction between devices; and therefore the easier comparisons drawn between this nature’s system and technology.

Creatures are organized into hierarchical structures of similar entities, of which the biosphere is the largest unit, within which are placed successively, ecosystems, communities, populations and individuals. The ecosystem represents a collection of populations and their non-living environment, and thus is an appropriate unit with which to compare many computational networks.

Analogies between computational systems and natural ecosystems have led to the concept of “computational ecology”. The dynamics of interacting networks of computers and other devices are considered as an entity, rather than focusing on the performance of individual machines; giving great interdependence of computing devices and the communications systems that link them. The related concept of “information ecosystem” emphasizes the information that is being transmitted between networked devices, rather than the devices themselves, but reinforces the dynamic nature of information flow.

![Alt text](image001.jpg "Optional title")

*Schematic of the Information-Communications Ecosystem Model
We could see the relations that users have with the cloud computing environment in which information processing tools and information/data bases placed within the entire environment. Cloud computing is no longer a trend but an emerging deployment model that is reshaping the landscape of what and how the information managers manage information processing.*

### Evolution systems

<a href="https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory5evosystem" style="float: left; width: 18%; margin-right: 2%; border: 1px solid gray"><img src="assets/theory5evosystem.jpg"></a> [Evolution Example](https://github.com/KISD/Nature-of-Code-Code-of-Nature/tree/master/code_from_nature/theory5evosystem)

Evolution has been clearly identified as the source of many diverse and creative solutions to problems in nature. However, it can also be useful as a problem solving tool in artificial systems. There is also the possibility in computer software of simulating living systems, and particularly their evolution. Computer scientists and other theoreticians realized that the selection and mutation of mechanisms that appear so effective in biological evolution could be abstracted to be implemented in computational algorithms.

There are two main strands to evolutionary systems in computing. First, there are the systems where the interest is in the algorithm which implements evolution, and the use of this algorithm for problem solving, called “evolutionary computation”. And second, a community fascinated by the complexity of living systems, and seek to recreate these, or their the major features, by simulation on computers , known as “artificial life”.

The application domains of evolutionary computation have been, and remain, wide. Evolutionary computation research was born in order to solve particular engineering applications. An example of this system is the genetic programming, which can be considered as a variant of genetic algorithms where individual genotypes are represented by executable programs where solutions are represented as trees of expressions in an appropriate programming language. The function of a genetic programming algorithm is to evolve in the most effective way to solve a particular problem.

![Flowchart](evolu.jpg "Structure of an evolutionary algorithm")

*Structure of an evolutionary algorithm.*

### Design from nature

Generative design is a process where the output is generated by a predetermined set of rules, codes, algorithms, or patterns. It has been inspired by natural processes, whereby designs are developed as mathematical patterns applied from nature.

”Generative Design is a morphogenetic process using algorithms structured as not-linear systems for endless unique and un-repeatable results performed by an idea-code, as in Nature.” Celestino Soddu, 1992.

Generative systems offer methods and philosophy to see the world as dynamic processes. With these systems design changes, and the output product is now the creation of the process; a dynamic artifact which contains information from the environment, using the most essential characteristics of nature as a complex system.

The challenge for designers is the reexamination of static products to understand the rules in which they are controlled and constructed. The design process, in this context, is based on the creation of generative codes to structure the ideas. The translation of ideas to words to algorithms to code, defines how the dynamics and relations among all the elements, and the logic behind them. Each event generated produces uniqueness, identity, and an artificial but natural-like complexity.

As a result of these generative design processes, there are not individual outputs but the creation of “species”. All the pieces produced by the same rules share “artificial DNA”, aiming to answer unpredictable requests through complexity, as natural events do. It is a minimalistic and optimized attempt to fit different necessities and demand of personalization from designers, customers and users.

### Conclusion

This experience of life makes it possible to observe the environment in a different way. We can identify liveliness in everything, including design and code. Structures and systems noticed in nature are translated into computing and design with the goal of creating more flexible rules for the man, than the today more commonly used.

Nature-inspired systems behave trying to emulate the natural ones, as through the methods of generative design the rules are incorporated in them, whereby the order is introduced in the processes and outputs. These are the product of algorithm methods, and behave as the natural ones in the sense of the possibility of adaptation, reproduction and complexity of processing information that shape them.

### References

Alexander, Christopher. The Nature of Order: An Essay on the Art of Building and the Nature of the Universe. Berkeley, CA: Center for Environmental Structure, 2004.

Brownlee, Jason. Clever Algorithms: Nature-inspired Programming Recipes. [S.l.]: Lulu, 2011.

Dorin, Alan; Innocent, Troy and McCormack, Jon. “Generative Design: A Paradigm for Design Research.” Futureground: Design Research Society International Conference 2004, 17th – 21st November 2004, Monash University, Faculty of Art & Design, Australia. Ed. John Redmond. Caulfield East, N.S.W.: Monash University, Faculty of Art & Design, 2004.

Frazer, John. An Evolutionary Architecture. London: Architectural Association, 1995.

Kuhn, Thomas S. The Structure of Scientific Revolutions. Chicago, IL: University of Chicago, 1996.

“Information Ecology.” Wikipedia. Wikimedia Foundation, 23 Dec. 2013. 2 Jan. 2014. <http://en.wikipedia.org/wiki/Information_ecology>.

Mandelbrot, Benoit B. The Fractal Geometry of Nature. San Francisco: W.H. Freeman, 1982.

Petrovskii, Sergei and Petrovskaya, Natalia. “Computational ecology as an emerging science.” Royal Society Publishing. 2 Jan. 2014. <http://rsfs.royalsocietypublishing.org/content/2/2/241.abstract>.

Reynolds, Craig W. “Craig W. Reynolds.” Craig W. Reynolds. 2 Jan. 2014. <http://www.red3d.com/cwr/index.html>.

Soddu, Celestino. “Papers on Generative Design (1991-2011).” Argenia© Generative Art & Science. 2 Jan. 2014. <http://www.argenia.it/papers.html>.

Vande Moere, Andrew. “Information Flocking Boids.” Visual Complexity. 2 Jan. 2014. <http://www.visualcomplexity.com/vc/project.cfm?id=44>.

Zomaya, Albert Y. Handbook of Nature-inspired and Innovative Computing: Integrating Classical Models with Emerging Technologies. New York: Springer Science Business Media, 2006.
