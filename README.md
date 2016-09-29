# Builder Image for Golang Applications

## Installation (Once-Off)
1. Install Openshift [s2i](https://github.com/openshift/source-to-image) binary
2. Clone current repository
3. Run `make`


## How to use it
Just simply run the following command:

```
s2i build <source_code_location> golang-builder <image>
```

## Examples

- Build an application Docker image from a Git repository:

```
$ s2i build git://github.com/jteso/envoy golang-builder envoy-app
```

- Build from a local directory

```
$ s2i build . golang-builder your-app
```

