{pkgs, lib,...}: {
    services.xonotic = {
        enable = true;
        openFirewall = true;
        settings = {
            port = 26000;
            sv_public = 0;
            hostname = "BiggerBens Xonotic $g_xonoticversion Server";
            rcon_password = "xonotic_rcon_passwd";
        };
    };
}
