# Scales

[![Build Status](https://travis-ci.org/hadley/scales.png?branch=master)](https://travis-ci.org/hadley/scales)
[![Coverage Status](https://img.shields.io/codecov/c/github/hadley/scales/master.svg)](https://codecov.io/github/hadley/scales?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/scales)](https://cran.r-project.org/package=scales)

One of the most difficult parts of any graphics package is scaling, converting from data values to perceptual properties. The inverse of scaling, making guides (legends and axes) that can be used to read the graph, is often even harder! The idea of the `scales` package is to implement scales in a way that is graphics system agnostic, so that everyone can benefit by pooling knowledge and resources about this tricky topic.

# Components

The `scales` package is made up of the following interdependent components

* Palettes, __pal__ for short, describe the useful palettes of aesthetics.

* Transformations, __trans__ for short, describe common scale transformations,
  their inverses, and ways of generating breaks and labels.

* Bounds: various ways of rescaling the data

* Scaling functions: pull together palettes, bounding functions and
  transformations to provide a complete pathway from raw data to perceptual
  properties

* Mutable ranges: in many graphics pathways, scale ranges can not be
  computed in a single pass, but must be computed over multiple groups or
  multiple panels. The mutable ranges (implemented with R's new
  reference based class) provide a thin layer of mutability to make this task
  easier.

Guide-related:

* Breaks and formats: ways of computing how tick marks/legend keys should be
  distributed across the data range, as well as how to convert those numeric
  positions into reader-friendly labels
  
