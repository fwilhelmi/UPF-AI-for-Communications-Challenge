# README #

# ITU_AI_Challenge_2020
Machine Learning for Performance Prediction of Channel Bonding in Next-Generation IEEE 802.11 WLANs - ITU AI Challenge 2020

[Video](https://itu.zoom.us/rec/play/u5AudO-qqzk3HtGQ4wSDUPZ8W9W9K6ys0CQW-fJYxUuxAnkCYVuvZrVGY-fkqqtdcjT1cucHNMGNq5Hm?autoplay=true&startTime=1594382177000) introducing the problem statement and the dataset

[Presentation](https://www.itu.int/en/ITU-T/AI/challenge/2020/Documents/ITU%20AI_ML%20Challenge%20-%20UPF.pdf) introducing the problem statement and the dataset​

### Authors
* [Francesc Wilhelmi](https://fwilhelmi.github.io/) (CTTC)
* David Góez (Universidad de Antioquia)
* Paola Soto (University of Antwerp)
* Ramon Vallés (Universitat Pompeu Fabra)
* Mohammad Alfaifi (Saudi Telecom)
* Abdulrahman Algunayah (Saudi Telecom)
* Jorge Martin-Pérez (Universidad Carlos III de Madrid)
* Luigi Girletti (Universidad Carlos III de Madrid)
* Rajasekar Mohan (PES University)
* K Venkat Ramnan (PES University)
* [Boris Bellalta](http://www.dtic.upf.edu/~bbellalt/) (Universitat Pompeu Fabra)

### Project description

With the advent of Artificial Intelligence (AI)-empowered communications, industry, academia, and standardization organizations are progressing on the definition of mechanisms and procedures to address the increasing complexity of future 5G and beyond communications. In this context, the International Telecommunication Union (ITU) organized the first AI for 5G Challenge to bring industry and academia together to introduce and solve representative problems related to the application of Machine Learning (ML) to networks. In this paper, we present the results gathered from Problem Statement 13 (PS-013), organized by Universitat Pompeu Fabra (UPF), which primary goal was predicting the performance of next-generation Wireless Local Area Networks (WLANs) applying Channel Bonding (CB) techniques. In particular, we overview the ML models proposed by participants (including Artificial Neural Networks, Graph Neural Networks, Random Forest regression, and gradient boosting) and analyze their performance on an open dataset generated using the IEEE 802.11ax-oriented Komondor network simulator. The accuracy achieved by the proposed methods demonstrates the suitability of ML for predicting the performance of WLANs. Moreover, we discuss the importance of abstracting WLAN interactions to achieve better results, and we argue that there is certainly room for improvement in throughput prediction through ML.

To meet the overarching goal of this project, a dataset was generated with the [Komondor simulator](https://github.com/wn-upf/Komondor/), which was provided to train machine learning models.

### Repository description
This repository contains the LaTeX files and other complementary material used for the article "Machine Learning for Performance Prediction of Channel Bonding in Next-Generation IEEE 802.11 WLANs", submitted to ITU journal.

You can find more information about the project at the website of the challenge's problem statement [https://www.upf.edu/web/wnrg/2020-edition](https://www.upf.edu/web/wnrg/2020-edition)
#### Repository organization

#### How-to guide

1. Download the dataset from [Zenodo](https://zenodo.org/record/4059189).
2. Provide predictions (see, for instance, the solution proposed by ATARI in [Processing>solutions_participants/atari/](https://github.com/fwilhelmi/UPF-AI-for-Communications-Challenge/tree/master/ai_challenge/solutions_participants/atari)).
3. Process the results (see, for instance, the files in [Processing>score_evaluation.m](https://github.com/fwilhelmi/UPF-AI-for-Communications-Challenge/blob/master/ai_challenge/score_evaluation.m))

### Contribute

If you want to contribute, please contact to [fwilhelmi@cttc.cat](fwilhelmi@cttc.cat)
