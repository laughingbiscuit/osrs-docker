sudo docker run --rm -it -e_JAVA_AWT_WM_NONREPARENTING=1 -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix --network=host lb/osrs
