{lib, pkgs, ...}@inputs :{
    services.openssh = {
        enable = true;
        startWhenNeeded = true;
        ports = [ 28 ];
        settings = {
            PasswordAuthentication = false;
        };
    };
    users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8aSoHPcKExpy2WC+sEhGWnaHTxbydB3vPLtxBM+qa0 biggerben@powerbookpro" ];
} 
