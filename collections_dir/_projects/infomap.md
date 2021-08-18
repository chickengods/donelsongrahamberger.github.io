---
layout: post
title: Funtional Brain ROI Clustering with InfoMap
summary: I applied InfoMap, a functional clustering method, to gain insight into how different parts of the brain interact.
card_image: /assets/images/metadatamapequation.svg
t_use: true
---

My first project at [Banks Lab](https://bankslab.wiscweb.wisc.edu/),in the department of Anesthesiology at UW-Madison, was to utilize an [InfoMap](https://www.mapequation.org/) to get a functional clustering of regions of interest (ROIs) within the brain. InfoMap leverages a random walk in Markov model to cluster said model by its network flow.

 Imagine that we take a random walk along our Markov model. Afterwards, we use [Huffman coding](https://en.wikipedia.org/wiki/Huffman_coding) to give each node a binary name based on the frequency of visitation. Then, we will use these new names to write down the path in which we visited our nodes. InfoMap seeks to compress this description of our journey, without losing any information, which will in turn cluster our node, in a functional manner. This is done by grouping nodes into so called 'cities'. Each city will have a unique name, and each node within a city unique name. However, nodes in different cities can share names, like how we can use Seattle and San Francisco as modifiers to differentiate between their respective Maple streets. We take this idea a bit farther thinking about how a state is a modifier for a city and a country is a modifier for a city and so on.
Now with cities, we don't just write down when we visit a node, but also when we enter and leave a city. Clustering nodes into cities decreases our journey's description length while clustering our nodes, killing two birds with one stone. For a deeper general overview: [Towards Data Science](https://towardsdatascience.com/infomap-algorithm-9b68b7e8b86) [The Map Equation](https://www.mapequation.org/assets/publications/EurPhysJ2010Rosvall.pdf)

I applied the InfoMap method to electrophysiological data collected from epilepsy patients and applied various connectivity measures to our electrode time series, which were then used as transition probability for my Markov models. There are various hyperparameters that we can tune to influence more or less clusters. The most pertinent of these was Markov Time. Markov Time lets you control the link flow to change the cost of moving between cities (lower mean more cities, higher means less). These hyperparameters were useful since our data was densely connected. Under default settings, all nodes would be clustered into a single city. Lowering the Markov time helps discourage a single cluster, bringing out most interesting results, as seen below.

![InfoMap Markov Time Example](/assets/images/infomap_markov_time.png "InfoMap Markov Time Example")

The results are from the second attempt at using InfoMap. The first attempt had no significant results, but I did teach a valuable lesson. Before you start a project, read all the relevant research even if you don't think it will be useful. Critically questioning  your results and a second pair of eyes are essential.

After my first failure, I returned to InfoMap, because my Principal Investigator, Matt Banks, got some interesting results clustering after applying [Diffusion Map Embedding]({{site.url}}/projects/dme-func-geom) to his data set. I wondered if I could get comparable results and I did. I don't know if these results will ever be published, but its nice to get some closure on my first failure of a project.
