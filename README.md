# วิธีใช้
จำเป็นต้องติดตั้ง [tmux](https://github.com/tmux/tmux) หรือ screen ก่อนใช้ script นี้!

## ตัวอย่าง
ในส่วน **```MODE```** ให้ใส่ screen หรือ tmux (แนะนำ screen) เช่น

```MODE="screen"```

ในส่วน **```SESSION_NAME```** ให้ใส่ชื่ออะไรก็ได้ห้ามวรรค

```SESSION_NAME="MY_SMP"```

ในส่วน **```COMMAND```** ใส่คำสั่งรันเซิร์ฟเวอร์ Minecraft ตามปกติ

```COMMAND="java -jar -Xmx4G minecraft-server.jar -nogui"```

ในส่วน **```WORK_DIR```** ให้ใส่ตำแหน่งที่ตั้งไดเรกทอรีเซิร์ฟเวอร์

```WORK_DIR="/home/peipei/minecraft_server"```

หากมีปัญหากับเซิร์ฟเวอร์ สามารถใช้ ```***./start.sh debug***``` หรือดู log จากไดเรกทอรีของเซิร์ฟเวอร์ได้
