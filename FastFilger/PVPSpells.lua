local spellIds = {
    ----------------
    -- Death Knight
    ----------------
    [108194] = "CC",            -- Asphyxiate
        [221562] = "CC",            -- Asphyxiate
    [47476]  = "Silence",       -- Strangulate
    [96294]  = "Root",          -- Chains of Ice (Chilblains)
    [45524]  = "Snare",         -- Chains of Ice
    [115018] = "Immune",        -- Desecrated Ground
    [218826] = "Immune",        -- Desecrated Ground
        [48707]  = "ImmuneSpell",   -- Anti-Magic Shell
    [48792]  = "Other",         -- Icebound Fortitude
    
    -- NEW
        [205630] = "CC",            -- ������֮��
        [216007] = "CC",            -- �������
        [200166] = "CC",            -- ��ħ����
        [211881] = "CC",            -- а�ܱ���
        [207171] = "CC",            -- �ݶ�����
        [179057] = "CC",            -- ��������
        [199804] = "CC",            -- ����ü��
        [209790] = "CC",            -- ����֮��
        [196958] = "CC",            -- ���г���
        [233582] = "Root",          -- �������
        [20066]  = "CC",            -- ���
    [207685] = "CC",            -- �������
        [217832] = "CC",            -- ����
        [221527] = "CC",            -- ����
        [213405] = "Snare",         -- Ͷ�����м���
        [204490] = "Silence",               -- ��Ĭ���
        [202933] = "Silence",               -- ֩�붤��
        [198909] = "CC",                    -- �ྫ֮��
        [224729] = "CC",                -- �������
        [171017] = "CC",                -- ���Ǵ��
        [227508] = "CC",                -- Ⱥ�����
        [203337] = "CC",                -- ��������
        [232055] = "CC",                -- ŭ����
        [209753] = "CC",            -- ����
        [202346] = "CC",            -- ���ϼ���
        [121253] = "Snare",         -- ����Ͷ
        [211793] = "Snare",         -- ����϶�
        [226943] = "CC",            -- ����ը��
        [207167] = "CC",            -- ��ä����
        [202274] = "CC",            -- �����
        [200196] = "CC",            -- ʥ��������
        [200200] = "CC",            -- ʥ��������
        [207165] = "CC",            -- ����֮��
        [205290] = "CC",            -- �ҽ�����
        [205273] = "Snare",         -- �ҽ�����
        [183218] = "Snare",         -- ����֮��
        [155145] = "Silence",           -- ��������
        [202719] = "Silence",           -- ��������
        [230083] = "Silence",           -- �����޷���
        [204399] = "CC",            -- ���֮ŭ
        [198088] = "CC",            -- ��ҫ��Ƭ
        [227781] = "CC",            -- ��ҫ��Ƭ
        [207498] = "Other",         -- ���滤��
        [196555] = "Immune",                -- �������
        [209426] = "Other",         -- �ڰ�
        [212800] = "Other",         -- ��Ӱ
        [215429] = "CC",                -- �������
        [205238] = "CC",                -- ��ҩͰ
        [220079] = "CC",                -- ��������
        [193597] = "CC",                -- ��������
        [203957] = "CC",                -- ʱ�ռ���
        [222198] = "CC",                -- ����
        [233395] = "Root",          -- �Ϻ�����
        [202773] = "CC",            -- ʯ��Ͷ��
        [203694] = "CC",            -- ��ʯͶ��
        [191530] = "CC",            -- ��ʯͶ��
        [170852] = "CC",            -- ����֮��
        [211810] = "CC",            -- ��­��
        [194279] = "Snare",         -- ����޼
        [190780] = "Snare",         -- ��˪��Ϣ
        [212638] = "Root",          -- ׷����֮��
        [206755] = "Snare",         -- ����֮��
        [200108] = "Root",          -- ����֮��
        [190927] = "Root",          -- ����ʹ�
        [194401] = "Root",          -- ���ø���
        [61385]  = "Root",          -- ��������
        [160067] = "Snare",         -- ��������
        [228215] = "CC",            -- �ﳾ����
        [200851] = "ImmuneSpell",           -- ��˯��֮ŭ
        [213691] = "CC",                -- ��ɢ���
        [202244] = "CC",                -- �������
        [197214] = "CC",                -- �ѵ���
        [198813] = "Snare",         -- ����ر�
        [222897] = "CC",                -- ����֮��
        [203343] = "Other",             -- ������
        [204246] = "CC",                -- ��ĥ�־�
        [199063] = "Root",              -- ����֮��
        [200273] = "Silence",           -- ų��
        [193585] = "CC",                -- ����
        [195944] = "CC",                -- ����ŭ��
        [193069] = "CC",                -- ����
        [212565] = "CC",                -- ��������
        [193969] = "Root",              -- ���
        [209027] = "CC",                -- ѹ�ƴ��
        [213233] = "CC",                -- ����֮��
        [217342] = "Root",              -- а�����
        [215552] = "CC",                -- �԰�����
        [195129] = "CC",                -- ������̤
        [197144] = "Root",              -- ����
        [196515] = "Root",              -- ħ������
        [192708] = "CC",                -- ����ը��
        [218012] = "CC",                -- ��������
        [183020] = "Root",          -- а������
        [195561] = "CC",                -- äĿ�Ļ�
        [222417] = "CC",                -- �����ʯ
        [214002] = "CC",                -- ��ѻ�ĸ���
        [199168] = "CC",                -- ������
        [201142] = "Snare",         -- �����ຮ
        [195645] = "Snare",         -- ˤ��
        [182832] = "CC",                -- ʯ��
        [198405] = "CC",                -- �̹Ǽ��
        [194140] = "CC",                -- ��ʯ����
        [227981] = "CC",                -- �Ϲ�ȭ
        [227977] = "CC",                -- ��Ŀ�ƹ�
        [228239] = "CC",                -- �־庿��
        [229705] = "Root",              -- ����
        [188818] = "Root",              -- ��Ӱ����
        [200329] = "CC",                -- ѹ���Կ־�
        [170995] = "Snare",         -- �з���
        [219397] = "CC",                -- ��ӥ�콵
        [111673] = "CC",                -- ��������
        [199097] = "CC",                -- ����֮��
        [197974] = "CC",                -- ��ǹ���
        [157997] = "Root",              -- ��������
        [205708] = "Snare",         -- ����
        [228600] = "Root",              -- �������
        [198121] = "Root",              -- ��˪˺ҧ
        [189157] = "CC",                -- ��������
        [200261] = "CC",                -- ��Ǵ��
        [199042] = "Root",              -- �������
        [202658] = "CC",                -- ��ȡ
        [213491] = "CC",                -- ��ħ��̤
        [216881] = "CC",                -- �־�����
        [223093] = "CC",                -- ����֮��
        [204437] = "CC",                -- �������
        [196942] = "CC",                -- ����
        [210873] = "CC",                -- ����
        [211004] = "CC",                -- ����
        [211010] = "CC",                -- ����
        [211015] = "CC",                -- ����
        [202318] = "CC",                -- ����ƣ��
        [204042] = "CC",                -- ����
        [198144] = "ImmuneSpell",       -- ������̬
        [200631] = "CC",                -- ��־���
        [232633] = "Silence",           -- ��������
        [222783] = "Silence",           -- ��������
        [225249] = "CC",                -- �����̤
        [191743] = "Silence",           -- �����Х
        [207979] = "CC",                -- �𵴲�
        [206580] = "CC",                -- �����ӿ�
        [209404] = "Silence",           -- ��ӡħ��
        [205097] = "CC",                -- а����ä
        [223914] = "CC",                -- �Ƶ�����
        [205341] = "CC",                -- ��©֮��
        [203110] = "CC",                -- ��˯����
        [210315] = "Root",              -- ���ʾ���
        [219256] = "CC",                -- ���������
        [199085] = "CC",                -- ս·
        [198551] = "CC",                -- ����
        [219108] = "Silence",           -- �������ߵĿ޺�
        [227917] = "CC",                -- ��ʫ���
        [217824] = "Silence",           -- ����֮��
        [194500] = "CC",                -- �����̤
        [210749] = "CC",                -- ����籩
        [196591] = "CC",                -- ��������
        [216044] = "CC",                -- ����ĥ�ߵĿ޺�
        [53148]  = "Root",              -- ���
        [201158] = "Root",              -- ����
        [162480] = "Root",              -- ��������
        [198304] = "Snare",         -- ����
        [236027] = "Snare",         -- ���
        [228837] = "CC",                -- �ͺ�
        [198758] = "Root",              -- ����
        [67890]  = "CC",                -- ����ը��
        [220128] = "Root",              -- ��˪����
        [229926] = "CC",                -- ����֮·
        [229108] = "CC",                -- ���
        [229152] = "Root",              -- ����
        [22915]  = "CC",                -- ǿ�������
        [133362] = "CC",                -- �λñ�����
        [133308] = "Root",              -- Ͷ��
        [134795] = "CC",                -- ��㯼�Х
        [129888] = "Silence",           -- �չ���
        [135621] = "CC",                -- �������
        [206762] = "CC",                -- �־���
        [204483] = "CC",                -- �۽����
        [219293] = "CC",                -- �־�����

                ----------------
        -- Death Knight Ghoul
        ----------------

        [91800]  = "CC",            -- Gnaw
        [91797]  = "CC",            -- Monstrous Blow (Dark Transformation)
                [196907] = "CC",            -- Cyclone
        [91807]  = "Root",          -- Shambling Rush (Dark Transformation)
    
    ----------------
    -- Druid
    ----------------

    [33786]  = "CC",            -- Cyclone
    [99]     = "CC",            -- Incapacitating Roar
    [163505] = "CC",            -- Rake
    [22570]  = "CC",            -- Maim
    [5211]   = "CC",            -- Mighty Bash
    [81261]  = "Silence",       -- Solar Beam
    [339]    = "Root",          -- Entangling Roots
    [45334]  = "Root",          -- Immobilized (Wild Charge - Bear)
    [102359] = "Root",          -- Mass Entanglement
    [50259]  = "Snare",         -- Dazed (Wild Charge - Cat)
    [58180]  = "Snare",         -- Infected Wounds
    [61391]  = "Snare",         -- Typhoon
    [127797] = "Snare",         -- Ursol's Vortex

    ----------------
    -- Hunter
    ----------------

    [117526] = "CC",            -- Binding Shot
    [3355]   = "CC",            -- Freezing Trap
    [13809]  = "Snare",         -- Ice Trap 1
    [19386]  = "CC",            -- Wyvern Sting
    [128405] = "Root",          -- Narrow Escape
    [5116]   = "Snare",         -- Concussive Shot
    [13810]  = "Snare",         -- Ice Trap 2
    [19263]  = "Immune",        -- Deterrence
    [186265]  = "Immune",       -- Deterrence

    ----------------
    -- Hunter Pets
    ----------------
        [24394]  = "CC",        -- Intimidation
        [50433]  = "Snare",     -- Ankle Crack (Crocolisk)
        [54644]  = "Snare",     -- Frost Breath (Chimaera)
        [54216]  = "Other",     -- Master's Call (root and snare immune only)

    ----------------
    -- Mage
    ----------------

    [31661]  = "CC",            -- Dragon's Breath
    [118]    = "CC",            -- Polymorph
    [61305]  = "CC",            -- Polymorph: Black Cat
    [28272]  = "CC",            -- Polymorph: Pig
    [61721]  = "CC",            -- Polymorph: Rabbit
    [61780]  = "CC",            -- Polymorph: Turkey
        [126819] = "CC",            -- Polymorph: Turkey
        [161353] = "CC",            -- Polymorph: Turkey
        [161354] = "CC",            -- Polymorph: Turkey
        [161355] = "CC",            -- Polymorph: Turkey
        [161372] = "CC",            -- Polymorph: Turkey
        [197105] = "CC",            -- Polymorph: Turkey
    [28271]  = "CC",            -- Polymorph: Turtle
    [82691]  = "CC",            -- Ring of Frost
    [140376] = "CC",            -- Ring of Frost
    [122]    = "Root",          -- Frost Nova
    [120]    = "Snare",         -- Cone of Cold
    [116]    = "Snare",         -- Frostbolt
    [44614]  = "Snare",         -- Frostfire Bolt
    [31589]  = "Snare",         -- Slow
    [45438]  = "Immune",        -- Ice Block
    [66309]  = "CC",            -- Ice Nova
    [110959] = "Other",         -- Greater Invisibility

        ----------------
        -- Mage Water Elemental
        ----------------
        [33395]  = "Root",      -- Freeze


    ----------------
    -- Monk
    ----------------

    [120086] = "CC",            -- Fists of Fury
    [119381] = "CC",            -- Leg Sweep
    [115078] = "CC",            -- Paralysis
    [116706] = "Root",          -- Disable
    [116095] = "Snare",         -- Disable
    [123586] = "Snare",         -- Flying Serpent Kick


    ----------------
    -- Paladin
    ----------------

    [105421] = "CC",            -- Blinding Light
    [853]    = "CC",            -- Hammer of Justice
    [20066]  = "CC",            -- Repentance
    [31935]  = "Silence",       -- Avenger's Shield
    [642]    = "Immune",        -- Divine Shield
    [31821]  = "Other",         -- Aura Mastery
    [1022]   = "Other",         -- Hand of Protection
          

    ----------------
    -- Priest
    ----------------

    [605]    = "CC",            -- Dominate Mind
    [88625]  = "CC",            -- Holy Word: Chastise
    [64044]  = "CC",            -- Psychic Horror
    [8122]   = "CC",            -- Psychic Scream
    [9484]   = "CC",            -- Shackle Undead
    [87204]  = "CC",            -- Sin and Punishment
    [15487]  = "Silence",       -- Silence
    [114404] = "Root",          -- Void Tendril's Grasp
    [15407]  = "Snare",         -- Mind Flay
    [47585]  = "ImmuneSpell",       -- Dispersion
    [114239] = "ImmuneSpell",   -- Phantasm
    [586]    = "Other",         -- Fade (Aura mastery when glyphed, dunno which id is right)
    [139]    = "Buff",

    ----------------
    -- Rogue
    ----------------

    [2094]   = "CC",            -- Blind
    [1833]   = "CC",            -- Cheap Shot
    [1776]   = "CC",            -- Gouge
    [408]    = "CC",            -- Kidney Shot
    [6770]   = "CC",            -- Sap
    [1330]   = "Silence",       -- Garrote - Silence
    [3409]   = "Snare",         -- Crippling Poison
    [26679]  = "Snare",         -- Deadly Throw
    [31224]  = "ImmuneSpell",   -- Cloak of Shadows
    [45182]  = "Other",         -- Cheating Death
    [5277]   = "Other",         -- Evasion
    [76577]  = "Other",         -- Smoke Bomb
    [88611]  = "Other",         -- Smoke Bomb
        [212182] = "Other",         -- Smoke Bomb
        [212183] = "Other",         -- Smoke Bomb

    ----------------
    -- Shaman
    ----------------

    [77505]  = "CC",            -- Earthquake
    [51514]  = "CC",            -- Hex
    [118905] = "CC",            -- Static Charge (Capacitor Totem)
    [64695]  = "Root",          -- Earthgrab (Earthgrab Totem)
    [3600]   = "Snare",         -- Earthbind (Earthbind Totem)
    [116947] = "Snare",         -- Earthbind (Earthgrab Totem)
    [77478]  = "Snare",         -- Earthquake (Glyph of Unstable Earth)
    [51490]  = "Snare",         -- Thunderstorm
    [8178]   = "ImmuneSpell",   -- Grounding Totem Effect (Grounding Totem)
    
        ----------------
        -- Shaman Primal Earth Elemental
        ----------------
        [118345] = "CC",        -- Pulverize

    ----------------
    -- Warlock
    ----------------

    [710]    = "CC",            -- Banish
    [5782]   = "CC",            -- Fear
    [118699] = "CC",            -- Fear
    [130616] = "CC",            -- Fear (Glyph of Fear)
    [5484]   = "CC",            -- Howl of Terror
    [22703]  = "CC",            -- Infernal Awakening
    [6789]   = "CC",            -- Mortal Coil
    [30283]  = "CC",            -- Shadowfury
    [31117]  = "Silence",       -- Unstable Affliction
    [104773] = "Other",         -- Unending Resolve

        ----------------
        -- Warlock Pets
        ----------------
        [89766]  = "CC",        -- Axe Toss (Felguard/Wrathguard)
        [115268] = "CC",        -- Mesmerize (Shivarra)
        [6358]   = "CC",        -- Seduction (Succubus)


    ----------------
    -- Warrior
    ----------------
    [5246]   = "CC",            -- Intimidating Shout (aoe)
    [132168] = "CC",            -- Shockwave
    [107570] = "CC",            -- Storm Bolt
    [132169] = "CC",            -- Storm Bolt
    [105771] = "Root",          -- Warbringer
    [1715]   = "Snare",         -- Hamstring
    [12323]  = "Snare",         -- Piercing Howl
    [46924]  = "Immune",        -- Bladestorm
        [227847] = "Immune",        -- Bladestorm
    [23920]  = "ImmuneSpell",   -- Spell Reflection
    [18499]  = "Other",         -- Berserker Rage

    ----------------
    -- Other
    ----------------

    [30217]  = "CC",        -- Adamantite Grenade
    [67769]  = "CC",        -- Cobalt Frag Bomb
    [30216]  = "CC",        -- Fel Iron Bomb
    [107079] = "CC",        -- Quaking Palm
    [13327]  = "CC",        -- Reckless Charge
    [20549]  = "CC",        -- War Stomp
        [47788]  = "Other",         -- �ػ�֮��
        [218826] = "Other",         -- ս������
        [116888] = "Other",         -- ����
        [198111] = "Other",     -- ʱ�⻤��
        [196555] = "Immune",        -- ���
        [25046]  = "Silence",       -- Arcane Torrent (Energy)
    [28730]  = "Silence",       -- Arcane Torrent (Mana)
    [50613]  = "Silence",       -- Arcane Torrent (Runic Power)
    [69179]  = "Silence",       -- Arcane Torrent (Rage)
    [80483]  = "Silence",       -- Arcane Torrent (Focus)
    [129597] = "Silence",       -- Arcane Torrent (Chi)
    [39965]  = "Root",      -- Frost Grenade
    [55536]  = "Root",      -- Frostweave Net
    [13099]  = "Root",      -- Net-o-Matic
    [1604]   = "Snare",     -- Dazed
    -- PvE
    --[123456] = "PvE",     -- This is just an example, not a real spell
}

local orderedSpellIds = {}
local orders = {"CC", "Silence", "Root", "Snare", "Immune", "ImmuneSpell", "Other"}
for oi,ov in pairs(orders) do
    for k,v in pairs(spellIds) do
        if v == ov then
            local spell = {spellID = k, spellType = v}
            table.insert(orderedSpellIds, spell)
            spellIds[k] = nil
        end
    end
end

local focus_position = {"BOTTOMLEFT", UIParent, "CENTER", 100, 200} 
local target_position = {"BOTTOMLEFT", UIParent, "CENTER", 100, -200}
local target_buff_position = {"TOPLEFT", UIParent, "CENTER", 200, -4}

local targetCC = {
    Name = "PVPTarget",
    Direction = "RIGHT", Interval = 0,
    Mode = "ICON", IconSize = 44,
    Position = {unpack(target_position)},
}
local focusCC =  {
    Name = "PVPFocus",
    Direction = "RIGHT", Interval = 0,
    Mode = "ICON", IconSize = 40,
    Position = {unpack(focus_position)},
}
local targetBuff =  {
    Name = "PVPBuff",
    Direction = "RIGHT", Interval = 2,
    Mode = "ICON", IconSize = 42,
    Position = {unpack(target_buff_position)},
}

for i,spell in pairs(orderedSpellIds) do
    local ID = spell.spellID
    local Type = spell.spellType
    if Type == "CC" or Type == "Root" or Type == "Silence" or Type == "Snare" then
        local targetV = {spellID =  ID, unitID = "target", caster = "all", filter = "DEBUFF"}
        local focusV = {spellID =  ID, unitID = "focus", caster = "all", filter = "DEBUFF"}
        table.insert(targetCC, targetV)
        table.insert(focusCC, focusV)
    else
        local buffV = {spellID =  ID, unitID = "target", caster = "all", filter = "BUFF"}
        table.insert(targetBuff, buffV)
    end
end

local AllSpells = Filger_Spells["ALL"] or {}
table.insert(AllSpells, targetCC)
table.insert(AllSpells, focusCC)
table.insert(AllSpells, targetBuff)
