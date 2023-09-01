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
```

Some first run steps are saved on init.sh or equivalent, after entering the first time you may need run these scripts
