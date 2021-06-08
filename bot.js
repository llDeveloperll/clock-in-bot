const Discord = require("discord.js");
const bot = new Discord.Client();
const config = require("./config.json");

bot.on("ready", () => {
    console.log(`Bot foi iniciado!`);
    bot.user.setActivity("Sua mãe do telhado"); 
});

bot.on("message", async msg => {
    if (msg.author.bot) return;
    if (msg.channel.type === "dm") return;
    if (msg.content.startsWith(config.prefix)) return;
    
    const args = msg.content.slice(config.prefix.length).trim().split(/ +/g);
    const comando = args.shift().toLowerCase();

    if (comando === "criador") {
        await msg.reply(`Quem me criou foi esse lindo aqui: ${bot.users.cache.get("333741694715428864")} `);
    }

    if (comando == "file") {
        await msg.channel.send({files:['./server.lua']});
    }
});

bot.login(config.token);
