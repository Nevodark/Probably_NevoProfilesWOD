ProbablyEngine.rotation.register_custom(259, "~|cFFC41F3BWoDAssassin|r~", {
 

 
--Cooldowns
{"14185", { --Preperation
	"modifier.cooldowns",
	"!playerbuff(11327)", --Vanish Buff
	"player.spell(1856).cooldown > 60", -- Checks Vanish Cooldown
	"player.energy >= 20"
}},

{"1856", { --Vanish
	"toggle.vanish",
	"!player.buff(1784)", --Stealth buff
	"!player.energy >= 100",
	"target.range <= 5"
}},

{"152151", { --Shadow reflection
	"modifier.cooldowns",
	"player.spell(79140).cooldown = 0", --Vendetta
	"target.range <= 5",
	"player.buff(5171)" --SnD --Aka will only use once setup to avoid dps whilst building up
}},

{"79140", { --Vendetta
	"modifier.cooldowns",
	"player.spell(152151).exists", -- Shadow Reflection
	"player.buff(152151)" --Shadow Reflection
}},

{"79140", {
	"modifier.cooldowns",
	"!player.spell(152151).exists", --Shadow Reflection
	"player.buff(5171)"
}},

--Main
{"1943", { --Rupture
	"player.combopoints = 5",
	"target.debuff(1943).duration <= 5"
}},

{"1329", { --Mutiliate
	"player.buff(11327)", --Vanish buff
}},

{"5171", { --Slice and dice
	"player.buff(5171).duration <= 1",
}},

{"137619", { --Marked For Death
	"player.combopoints = 0",
}},

{"121411", { --Crimson Tempest
	"modifier.multitarget",
	"player.combopoints = 5",
	"target.debuff(122233).duration <= 8" --Crimson Tempest Bleed
}},

{"51723", { --Fan of knives
	"modifier.multitarget",
	"player.combopoints <= 4",
	"target.range <= 8"
}},

{"1943", { --Rupture
	"target.debuff(1943).duration <= 1.5"
}},

{"32645", { --Envenom
	"player.combopoints > 4",
	"player.buff(32645).duration < 2", --Envenom buff
	"player.spell(152150).cooldown > 2" --death from above
}},

{"32645", { --Envenom
	"!player.spell(152150).exists", --Death from above
	"player.combopoints > 4",
	"player.buff(32645).duration <= 2.5" --Envenom buff
}},

{"51723", { --Fan of knives
	"modifier.multitarget",
	"!target.debuff(122233).duration <= 6"
}},

{"1329", { --Mutilate
	"target.health >= 36",
	"player.combopoints <= 4"
}},

{"111240", {
	"player.spell(114015).exists",
	"player.buff(115189).count < 5"
}},

{"111240", { --Dispatch
	"target.health <= 35",
	"player.combopoints < 5",
	"!player.spell(114015).exists"
}},


{ --OOC
{"1329", { --Mutiliate
	"player.buff(11327)", --Vanish buff
}},
}},
 function()
 ProbablyEngine.toggle.create('vanish', 'Interface\\Icons\\ability_vanish','Vanish','Enable or Disable use of Vanish')	  
 end)