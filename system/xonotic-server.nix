{pkgs, lib,...}: {
    services.xonotic = {
        enable = true;
        openFirewall = true;
        settings = {
            port = 26000;
            sv_public = 0;
            sys_ticrate = 0.015625;
            hostname = "BiggerBens Xonotic $g_xonoticversion Server";
            sv_motd = "If you read this you're gay now.";
            rcon_password = "xonotic_rcon_passwd";
        };
    };
}
