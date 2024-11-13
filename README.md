# Instrucciones para ejecutar con Vagrant

## Prerrequisitos

- [Vagrant](https://www.vagrantup.com/downloads) instalado
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) instalado

## Pasos para ejecutar

1. Clona el repositorio en tu máquina local:
    ```sh
    git clone https://github.com/antoniocmizv/servidor-nginx.git
    cd servidor-nginx
    ```

2. Inicia la máquina virtual con Vagrant:
    ```sh
    vagrant up
    ```

3. Conéctate a la máquina virtual:
    ```sh
    vagrant ssh
    ```

5. Abre tu navegador y accede a `192.168.10.10` para ver el servidor en funcionamiento, esta es la ip que yo he establecido, puedes cambiarla en el archivo Vagrantfile.

## Actualización archivo host Windows
Para acceder al servidor desde tu navegador, es posible que necesites actualizar el archivo `hosts` de tu sistema operativo para que el nombre de dominio apunte a la dirección IP de la máquina virtual.

### Windows

1. Abre el Bloc de notas como administrador.
2. Navega a `C:\Windows\System32\drivers\etc\hosts`.
3. Añade la siguiente línea al final del archivo:
    ```
    192.168.10.10 www.antho.test
    192.168.10.10 dj.test
    ```
4. Guarda los cambios y cierra el Bloc de notas.

### Linux / macOS

1. Abre una terminal.
2. Edita el archivo `/etc/hosts` con tu editor de texto preferido, por ejemplo:
    ```sh
    sudo nano /etc/hosts
    ```
3. Añade la siguiente línea al final del archivo:
    ```
    192.168.10.10 www.antho.tes
    192.168.10.10 dj.test
    ```
4. Guarda los cambios y cierra el editor.

Después de realizar estos cambios, deberías poder acceder al servidor en funcionamiento visitando `http://www.antho.test` en tu navegador.

## Comandos útiles

- Para detener la máquina virtual:
    ```sh
    vagrant halt
    ```

- Para reiniciar la máquina virtual:
    ```sh
    vagrant reload
    ```

- Para destruir la máquina virtual:
    ```sh
    vagrant destroy
    ```


