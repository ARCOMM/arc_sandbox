let maps = HEMTT_VFS.join("maps.txt").open_file().read();
let cfgMissions = "class CfgMissions {\n    class MPMissions {\n";
for line in maps.split("\n") {
    line.trim();

    if line.len < 1 {
        continue;
    }

    if line[0] != '#' {
        let n = "MP_ARC_SANDBOX_" + line;

        HEMTT_VFS.join("addons").join("missions").join("MP_ARC_SANDBOX_template").copy(HEMTT_VFS.join("addons").join("missions").join(n + "." + line));

        cfgMissions += "        class " + n + " {\n";
        cfgMissions += "            briefingName = \"ARC_SANDBOX_" + line + "\";\n";
        cfgMissions += "            directory = \"z\\arc_snd\\addons\\missions\\" + n + "." + line + "\";\n";
        cfgMissions += "        };\n";
    }
}
cfgMissions += "\n    };\n};\n";

HEMTT_VFS.join("addons").join("main").join("CfgMissions.hpp").create_file().write(cfgMissions);
