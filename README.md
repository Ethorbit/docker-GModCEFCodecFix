A Docker image of [GModCEFCodecFix](https://github.com/solsticegamestudios/GModCEFCodecFix)

Example: 

```
docker run -it \
    --rm --name "gmod-cef-codec" \
    -v "/home/workstation/.var/app/com.valvesoftware.Steam/.steam/steam:/home/python/.steam/steam" \
    -v "/mnt/games:/mnt/games" \
    ethorbit/gmod-cef-codec-fix:latest
```

The first volume map is to your Steam path, the second one is to the other drive where Garry's Mod is installed, if you have it installed to another drive. GModCEFCodecFix needs both.
