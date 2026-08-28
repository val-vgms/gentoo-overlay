# Overlay val-vgms

Este repositorio contiene paquetes que no pude encontrar en otros overlays disponibles en la [lista de repositorios de layman](https://gpo.zugaina.org/). Cubriendo diferentes ramas, pero más enfocado en juegos y personalización como temas o tipografías.

Cada ebuild fue escrito completamente a mano, aunque basándome en otros ebuilds y plantillas para lograr su ejecución final, y estará en crecimiento lento pero constante.

Para añadir este repositorio, por el momento sólo está disponible manualmente, a través de `eselect repository`.

```sh
sudo eselect repository add val-vgms git https://github.com/val-vgms/gentoo-overlay.git
```

Los paquetes disponibles aquí son:

**Juegos**

[games-misc/hhd](https://github.com/hhd-dev/hhd): Handheld Daemon, una herramienta para gestionar los controles de consolas portátiles.


**Tipografías**

[media-fonts/joypixels](https://joypixels.com/): Emoji como servicio (antes conocido como EmojiOne)

[media-fonts/ttf-aptos](https://learn.microsoft.com/en-us/typography/font-list/aptos): La nueva tipografía por defecto de Microsoft 365, usada por Microsoft


**Terminales**

[x11-terms/qmlkonsole](https://invent.kde.org/plasma-mobile/qmlkonsole): Aplicación de terminal para Plasma Mobile


**Paquetes de iconos**

[x11-themes/colloid-icon.theme](https://github.com/vinceliuice/Colloid-icon-theme): Tema de iconos coloidal para escrotirios Linux


**Cursores**

[x11-themes/layan-cursors](https://github.com/vinceliuice/Layan-cursors): Tema de punteros X basado en Capitaine Cursors


**Temas de escrotirio**

[x11-themes/layan-gtk-theme](https://github.com/vinceliuice/Layan-gtk-theme): Tema GTK+ plano basado en Material Design

[x11-themes/layan-plasma](https://github.com/vinceliuice/Layan-kde): Tema Layan para KDE Plasma


<hr />

Paquetes monitoreados para ser actualziados en cuanto una versión estable esté disponible. Comentarios y sugerencias aceptados.