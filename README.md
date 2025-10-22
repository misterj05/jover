# jover

This is my personal Gentoo overlay. (I know, yet another overlay amirite)

The name (pronounced either Jay-oh-ver or Joe-ver) is a play on my
name "misterj", overlay and "It's so joever".

I intend to keep it relatively small for the time being.

> [!IMPORTANT]
> This overlay is hosted on [Codeberg](https://codeberg.org/misterj05/jover)
> and is mirrored onto other forges for discoverability.
>
> Issues, PRs, etc, will be ignored on forges other than Codeberg.

## To add the overlay

With app-eselect/eselect-repository installed:

```
eselect repository add jover git https://codeberg.org/misterj05/jover.git
```

## To remove the overlay

```
eselect repository remove -f jover
```

## Package docs

If a package in this overlay is already contained within a well known
overlay, there will be a README in the ebuild directory explaining what
is different with this version of the package, even if it's just a simple
version bump.

If I feel I need to explain anything related to an ebuild it will also
be contained in a README.

I hated that many of the overlays out there don't do this in some way,
not every person using your overlay is going to understand ebuilds
so it's nice to provide a user friendly explanation to them.

## Only unmask what you want

I recommend adding `*/*::jover` somewhere in your package.mask and manually
unmasking packages from this overlay in package.unmask.

The reason is because if anything in this overlay ever
conflicts with ::gentoo or ::guru, etc, portage won't pull from this
overlay unless you want it to.

## Contributing

Please see
[CONTRIBUTING.md](https://codeberg.org/misterj05/jover/src/branch/main/CONTRIBUTING.md)
