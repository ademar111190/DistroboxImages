# DistroboxImages
A collection of Distrobox images

# Building an image

```bash
podman build -f <<Container.dockerfile>> -t <<image name>>
```

# Building a box

```bash
distrobox create <<box name>> -H <<path to box home folder>> -i <<image name>>
distrobox enter <<image name>>
init-script # init some stuff on the for the user as I'm passing a custom home to distrobox
```
