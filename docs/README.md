# Supersonic docs

This is the documentation for Supersonic, which can be found at docs.appgyver.com.

## Run locally

To run the docs locally when e.g. making changes, run

```bash
jekyll serve --watch
```

## Deploying

Build the docs first. See [Supersonic README](../README.md) for instructions.

After building, you can deploy the docs:

```bash
jekyll build
./deploy -e <testgyver.com | appgyver.com>
```
