Config = {}
Config['Debug'] = false -- crear clon para probar sincronización





Config.Animations = {

	{
		name  = 'misc',
		label = 'Acciones',
		items = {
			
			{label = "Sentarse silla", 			type = "scenario", 	data = { anim = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" 								}},
			{label = "Sentarse sillón", 		type = "scenario", 	data = { anim = "PROP_HUMAN_SEAT_SUNLOUNGER" 									}},
			{label = "Sentado Mirando Teléfono", type = "anim", data = {lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle"}},
			{label = "Apoyarse en barra",		type = "scenario", data = {anim = "prop_human_bum_shopping_cart"}},
			{label = "Apoyado mesa", 			type = "anim", 		data = { lib = "anim@amb@warehouse@toolbox@", 	anim = "idle" 					}},
			{label = "Sentarse en el suelo", type = "scenario", data = {anim = "WORLD_HUMAN_PICNIC"}},
			
			{label = "Apoyarse en pared", type = "scenario", data = {anim = "WORLD_HUMAN_LEANING"}},
			{label = "Boca arriba", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE_BACK"}},
			{label = "Boca Abajo", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE"}},
			{label = "Acostado", 				type = "scenario", 	data = { anim = "WORLD_HUMAN_BUM_SLUMPED" 										}},
			{label = "Apoyado de lado",			type = "anim", 		data = { lib = "timetable@ron@ig_3_p2", 		anim = "ig_3_p2_base" 			}},			
			{label = "Posición de T", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female"}},
			{label = "Selfie", type = "scenario", data = {anim = "world_human_tourist_mobile"}},
			{label = "Escuchar a Escondidas", type = "anim", data = {lib = "mini@safe_cracking", anim = "idle_base"}},
			{label = "Beber Cafe", type = "anim", data = {lib = "amb@world_human_aa_coffee@idle_a", anim = "idle_a"}}, --anim mal
			{label = "Arrastrarse de espaldas", type = "anim", 		data = { lib = "move_crawl", 					anim = "onback_bwd" 			}},
			{label = "Contar monedas", 			type = "scenario", 	data = { anim = "PROP_HUMAN_PARKING_METER" 										}},
			{label = "Lavarse la cara",			type = "anim", 		data = { lib = "missmic2_washing_face", 		anim = "michael_washing_face" 	}},
			{label = "Simular llamada",			type = "anim", 		data = { lib = "missmic4premiere", 				anim = "prem_producer_argue_a" 	}}			
		}
	},
	{
		name  = 'humors',
		label = 'Humor',
		items = {
			{label = "Adiós", type = "anim", data = {lib = "anim@mp_player_intupperwave", anim = "idle_a"}},
			{label = "Paz hermano", type = "peace", data = {""}}, --Radiant
			{label = "Fuck you", type = "finger", data = {""}}, --Radiant
			{label = "Fuck you x 2", type = "finger2", data = {""}}, --Radiant
			{label = "Facepalm", type = "palm", data = {""}},  --Radiant
			{label = "Frustrado", type = "damn", data = {""}},  --Radiant
			{label = "Fail", type = "fail", data = {""}},  --Radiant
			{label = "No puede ser...", type = "no", data = {""}},  --Radiant
			{label = "Nigga - 1", type = "gang1", data = {""}},  --Radiant
			{label = "Nigga - 2 ", type = "gang2", data = {""}},  --Radiant
			{label = "Arrascarse el culo", type = "pickbutt", data = {""}},  --Radiant
			{label = "Aplauso - 1", type = "slowclap", data = {""}},  --Radiant
			{label = "Aplauso - 2", type = "cheer", data = {""}}, 
			{label = "¡Buen trabajo!", type = "anim", data = {lib = "mp_action", anim = "thanks_male_06"}},
			{label = "¡Allí!", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_point"}},
			{label = "Ven, ven...", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_come_here_soft"}}, 
			{label = "Vacilar", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_bring_it_on"}},
			{label = "¿Yo?", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_me"}},
			{label = "¡Lo sabía!", type = "anim", data = {lib = "anim@am_hold_up@male", anim = "shoplift_high"}},
			{label = "Agotado", type = "scenario", data = {lib = "amb@world_human_jog_standing@male@idle_b", anim = "idle_d"}},
			{label = "Estoy en la mierda", type = "scenario", data = {lib = "amb@world_human_bum_standing@depressed@idle_a", anim = "idle_a"}},
			{label = "Tranquilízate", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_easy_now"}},
			{label = "Preocupado", type = "anim", data = {lib = "oddjobs@assassinate@multi@", anim = "react_big_variations_a"}},
			{label = "Asustarse", type = "anim", data = {lib = "amb@code_human_cower_stand@male@react_cowering", anim = "base_right"}},
			{label = "Prepararse para pegarse", type = "anim", data = {lib = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e"}},
			{label = "Suicidio pistola", type = "anim", data = {lib = "mp_suicide", anim = "pistol"}},
		}
	},
	{
		name  = 'work',
		label = 'Trabajos',
		items = {
			
			{label = "Fotógrafo", type = "scenario", data = {anim = "WORLD_HUMAN_PAPARAZZI"}},
			{label = "Escribir Notas", type = "notes",data = {anim = ""}}, --Objeto mal
			{label = "Pescar", type = "scenario", data = {anim = "world_human_stand_fishing"}},
			{label = "Investigar Suelo", type = "anim", data = {lib = "amb@code_human_police_investigate@idle_b", anim = "idle_f"}},
			{label = "Observar Suelo", type = "scenario", data = {anim = "CODE_HUMAN_MEDIC_KNEEL"}},
			{label = "Hablar por Radio", type = "anim", data = {lib = "random@arrests", anim = "generic_radio_chatter"}},
			{label = "Dirigir Tráfico", type = "scenario", data = {anim = "WORLD_HUMAN_CAR_PARK_ATTENDANT"}}, --objeto mal?
			{label = "Prismáticos", type = "scenario", data = {anim = "WORLD_HUMAN_BINOCULARS"}},
			{label = "Jardinero", type = "scenario", data = {anim = "world_human_gardener_plant"}},
			{label = "Reparar Motor", type = "anim", data = {lib = "mini@repair", anim = "fixing_a_ped"}},
			{label = "Hablar con pasajero (Vehículo}", type = "anim", data = {lib = "oddjobs@taxi@driver", anim = "leanover_idle"}},
			{label = "Dar Factura (Vehículo}", type = "anim", data = {lib = "oddjobs@taxi@cyi", anim = "std_hand_off_ps_passenger"}},
			{label = "Coger cajas", type = "anim", data = {lib = "mp_am_hold_up", anim = "purchase_beerbox_shopkeeper"}},
			{label = "Servir bebida", type = "anim", data = {lib = "mini@drinking", anim = "shots_barman_b"}},
			{label = "Martillo", type = "scenario", data = {anim = "WORLD_HUMAN_HAMMERING"}},
			{label = "Pedir limosna", type = "scenario", data = {anim = "WORLD_HUMAN_BUM_FREEWAY"}},
			{label = "Estatua", type = "scenario", data = {anim = "WORLD_HUMAN_HUMAN_STATUE"}},
			{label = "Limpiar", type = "scenario", data = {anim = "world_human_maid_clean"}},
			{label = "Barbacoa", type = "scenario", data = {anim = "PROP_HUMAN_BBQ"}},
		}
	},	
	{
		name  = 'security',
		label = 'Seguridad',
		items = {
			{label = "Saludo Militar", type = "salute", data = {""}},
			{label = "Escribir Notas", type = "notes",data = {anim = ""}},
			{label = "Juntar manos", type = "guard",data = {anim = ""}},
			{label = "Manos en cinturón", type = "copidle",data = {anim = ""}},
			{label = "Cartuchera", type = "holster",data = {anim = ""}},
			{label = "Arma en mano - 1", type = "aim",data = {anim = ""}},
			{label = "Arma en mano - 2", type = "aim2",data = {anim = ""}},
			{label = "Dirigir Tráfico - 1", type = "scenario", data = {anim = "WORLD_HUMAN_CAR_PARK_ATTENDANT"}},
			{label = "Dirigir Tráfico - 2", type = "copcrowd", data = {""}},
			{label = "Dirigir Tráfico - 3", type = "copcrowd2", data = {""}},
			{label = "Hacer fotos", type = "scenario", data = {anim = "WORLD_HUMAN_PAPARAZZI"}},
			{label = "Maletín", type = "brief", data = {""}},

		}
	},
	
	
	{
		name  = 'festives',
		label = 'Fiesta',
		items = {
			{label = "Tocar instrumento", type = "scenario", data = {anim = "WORLD_HUMAN_MUSICIAN"}},
			{label = "Dj", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@dj", anim = "dj"}},
			{label = "Beber Cerveza", type = "scenario", data = {anim = "WORLD_HUMAN_DRINKING"}},
			{label = "Bailar con cerveza", type = "scenario", data = {anim = "WORLD_HUMAN_PARTYING"}},
			{label = "Guitarra invisible", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@air_guitar", anim = "air_guitar"}},
			{label = "¡Yeahhh!", type = "anim", data = {lib = "mp_player_int_upperrock", anim = "mp_player_int_rock"}},
			{label = "Borracho", type = "anim", data = {lib = "amb@world_human_bum_standing@drunk@idle_a", anim = "idle_a"}},
			{label = "Vomitar en vehículo", type = "anim", data = {lib = "oddjobs@taxi@tie", anim = "vomit_outside"}},
		}
	},
	{
		name  = 'sports',
		label = 'Deportes',
		items = {
			{label = "Musculitos", type = "anim", data = {lib = "amb@world_human_muscle_flex@arms_at_side@base", anim = "base"}},
			{label = "Pesas", type = "anim", data = {lib = "amb@world_human_muscle_free_weights@male@barbell@base", anim = "base"}},
			{label = "Flexiones", type = "anim", data = {lib = "amb@world_human_push_ups@male@base", anim = "base"}},
			{label = "Abdominales", type = "anim", data = {lib = "amb@world_human_sit_ups@male@base", anim = "base"}},
			{label = "Yoga", type = "anim", data = {lib = "amb@world_human_yoga@male@base", anim = "base_a"}},
		}
	},

	

	{
		name  = 'attitudem',
		label = 'Andares',
		items = {
			{label = "Borracho", type = "attitude", data = {lib = "move_m@drunk@moderatedrunk", anim = "move_m@drunk@moderatedrunk"}},
			{label = "Decidido", type = "attitude", data = {lib = "move_m@shocked@a", anim = "move_m@shocked@a"}},
			{label = "Casual", type = "attitude", data = {lib = "move_m@casual@a", anim = "move_m@casual@a"}},
			{label = "Obeso", type = "attitude", data = {lib = "move_m@fat@a", anim = "move_m@fat@a"}},
			{label = "Hipster", type = "attitude", data = {lib = "move_m@hipster@a", anim = "move_m@hipster@a"}},
			{label = "Herido", type = "attitude", data = {lib = "move_m@injured", anim = "move_m@injured"}},
			{label = "Nigga", type = "attitude", data = {lib = "move_m@shadyped@a", anim = "move_m@shadyped@a"}},
			{label = "Incómodo", type = "attitude", data = {lib = "move_m@buzzed", anim = "move_m@buzzed"}},
			{label = "Agresivo", type = "attitude", data = {lib = "move_m@hurry_butch@a", anim = "move_m@hurry_butch@a"}},
			{label = "Engreído", type = "attitude", data = {lib = "move_m@money", anim = "move_m@money"}},
			{label = "Rápido", type = "attitude", data = {lib = "move_m@quick", anim = "move_m@quick"}},
			{label = "Normal Hombre", type = "attitude", data = {lib = "move_m@confident", anim = "move_m@confident"}},
			{label = "Normal Mujer", type = "attitude", data = {lib = "move_f@heels@c", anim = "move_f@heels@c"}},
			{label = "Deprimido", type = "attitude", data = {lib = "move_m@depressed@a", anim = "move_m@depressed@a"}},
			{label = "Distraido", type = "attitude", data = {lib = "move_f@depressed@a", anim = "move_f@depressed@a"}},
			{label = "Negocios", type = "attitude", data = {lib = "move_m@business@a", anim = "move_m@business@a"}},
			{label = "Determinado", type = "attitude", data = {lib = "move_m@brave@a", anim = "move_m@brave@a"}},
			{label = "Intimidante", type = "attitude", data = {lib = "move_m@hurry@a", anim = "move_m@hurry@a"}},
			{label = "Torpe", type = "attitude", data = {lib = "move_m@hobo@a", anim = "move_m@hobo@a"}},
			{label = "Pensativo", type = "attitude", data = {lib = "move_m@sad@a", anim = "move_m@sad@a"}},
			{label = "Tranquilo", type = "attitude", data = {lib = "move_m@muscle@a", anim = "move_m@muscle@a"}},
			{label = "Provocativo", type = "attitude", data = {lib = "move_f@maneater", anim = "move_f@maneater"}},
			{label = "Firme", type = "attitude", data = {lib = "move_f@sassy", anim = "move_f@sassy"}},	
			{label = "Arrogante", type = "attitude", data = {lib = "move_f@arrogant@a", anim = "move_f@arrogant@a"}},
		}
	},
	{
		name  = 'Bailes',
		label = 'Bailes',
		items = {
			{label = "Baile 1", type = "anim", data = {lib = "anim@amb@nightclub@dancers@dixon_entourage@", anim = "mi_dance_facedj_15_v1_male^4"}},
            {label = "Baile 2", type = "anim", data = {lib = "anim@amb@nightclub@dancers@podium_dancers@", anim = "hi_dance_facedj_17_v2_male^5"}},
            {label = "Baile 3", type = "anim", data = {lib = "misschinese2_crystalmazemcs1_cs", anim = "dance_loop_tao"}},
            {label = "Baile 4", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@uncle_disco", anim = "uncle_disco"}},
            {label = "Baile 5", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@raise_the_roof", anim = "raise_the_roof"}},
            {label = "Baile 6", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@cats_cradle", anim = "cats_cradle"}},
            {label = "Baile 7", type = "anim", data = {lib = "anim@mp_player_intupperbanging_tunes", anim = "idle_a"}},
            {label = "Baile 8", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", anim = "high_center"}},
            {label = "Baile 9", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center"}},
            {label = "Baile 10", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", anim = "high_center"}},
            {label = "Baile 11", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"}},
            {label = "Baile 12", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"}},
            {label = "Baile 13", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^6"}},
            {label = "Baile 14", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^6"}},
            {label = "Baile 15", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@hi_podium@", anim = "danceidle_hi_06_base_laz"}},
            {label = "Baile 16", type = "anim", data = {lib = "amb@code_human_in_car_mp_actions@dance@bodhi@ds@base", anim = "idle_a_fp"}},
            {label = "Baile 17", type = "anim", data = {lib = "amb@code_human_in_car_mp_actions@dance@bodhi@rds@base", anim = "idle_b"}},
            {label = "Baile 18", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"}},
            {label = "Baile 19", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"}},
            {label = "Baile 20", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"}},
            {label = "Baile 21", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"}},
            {label = "Baile 22", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^6"}},
            {label = "Baile 23", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^6"}},
            {label = "Baile 24", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", anim = "med_center_up"}},
            {label = "Baile 25", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^6"}},
            {label = "Baile 26", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"}},
            {label = "Baile 27", type = "anim", data = {lib = "timetable@tracy@ig_5@idle_b", anim = "idle_e"}},
            {label = "Baile 28", type = "anim", data = {lib = "mini@strip_club@idles@dj@idle_04", anim = "idle_04"}},
            {label = "Baile 29", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_1@monologue_1a", 	anim = "mtn_dnc_if_you_want_to_get_to_heaven"}},
            {label = "Baile 30", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_3@monologue_3a", 	anim = "mnt_dnc_buttwag"}},
            {label = "Baile 31", type = "anim", data = {lib = "anim@amb@nightclub@dancers@black_madonna_entourage@", 	anim = "hi_dance_facedj_09_v2_male^5"}},
			{label = "Baile 32", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_single_props@", 	anim = "hi_dance_prop_09_v1_male^6"}},
			{label = "Baile 33", type = "anim", data = { lib = "missfbi3_sniping", 									 	anim = "dance_m_default" 		}},
            
		}
	},	
	{
		name  = 'porn',
		label = '+18',
		items = {
			{label = "Baile Sexy 1", type = "anim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", anim = "ld_girl_a_song_a_p1_f"}},
			{label = "Baile Sexy 2", type = "anim", data = {lib = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2"}},
			{label = "Baile Sexy 3", type = "anim", data = {lib = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3"}},
			{label = "Masturbarse", type = "anim", data = {lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01"}},
			{label = "Tocarse los partes", type = "grabcrotch", data = {""}}, --Radiant
			{label = "Provocar", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_02"}},
			{label = "Pose Sexy", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
			{label = "Mostrar pechos", type = "anim", data = {lib = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b"}},
			{label = "Simular sexo", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@air_shagging", anim = "air_shagging"}},
		}
	}
}

Strings = {
    ['Choose_Favorite'] = 'What button do you want to use for %s?',
    ['Select_Favorite'] = 'Add a quick bind animation',
    ['Manage_Favorites'] = 'Manage quick bind animations',
    ['Close'] = 'Cancel',
    ['Updated_Favorites'] = 'Updated quick bind animations.',
    ['Remove?'] = 'Remove "%s" as a quick bind animation?',
    ['Yes'] = 'Yes',
    ['No'] = 'No',
    ['Animations'] = 'Animaciones',
    ['Synced'] = 'Animaciones sincronizadas',
    ['Sync_Request'] = 'Quieres %s a %s?',
    ['Pole_Dance'] = '[~r~E~w~] Poledance',
    ['Noone_Close'] = 'No hay nadie cerca.',
    ['Not_In_Car'] = 'No estás dentro de un vehículo!'
}

Config['PoleDance'] = { -- barrar de baile
    ['Enabled'] = true,
    ['Locations'] = {
        {['Position'] = vector3(112.60, -1286.76, 28.56), ['Number'] = '3'},
        {['Position'] = vector3(104.18, -1293.94, 29.26), ['Number'] = '1'},
        {['Position'] = vector3(102.24, -1290.54, 29.26), ['Number'] = '2'}
    }
}

Config['Synced'] = {
    {
        ['Label'] = 'Abrazo',
        ['RequesterLabel'] = 'abrazar a ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.05,
                ['yP'] = 1.15,
                ['zP'] = -0.05,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Chocar manos five',
        ['RequesterLabel'] = 'Chocar manos con ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'highfive_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'highfive_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.5,
                ['yP'] = 1.25,
                ['zP'] = 0.0,

                ['xR'] = 0.9,
                ['yR'] = 0.3,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Abrazo nigga',
        ['RequesterLabel'] = 'Abrazar nigga con ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.025,
                ['yP'] = 1.15,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Fistbump',
        ['RequesterLabel'] = 'fistbump',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationpaired@f_f_fist_bump', ['Anim'] = 'fist_bump_left', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationpaired@f_f_fist_bump', ['Anim'] = 'fist_bump_right', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.6,
                ['yP'] = 0.9,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 270.0,
            }
        }
    },
    {
        ['Label'] = 'Saludo manos (Amigo}',
        ['RequesterLabel'] = 'chocar manos con ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.0,
                ['yP'] = 1.2,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Dar algo (trabajo}',
        ['RequesterLabel'] = 'dar algo a ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.075,
                ['yP'] = 1.0,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
       
}

Config['Synced+18'] = {


	 -- NSFW animations vvvvvvvv
	 {
		['Label'] = 'Felación (de pie}',
		['RequesterLabel'] = 'recibir felación de ',
		['Requester'] = {
			['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'pimpsex_hooker', ['Flags'] = 1, ['Attach'] = {
				['Bone'] = 9816,
				['xP'] = 0.0,
				['yP'] = 0.65,
				['zP'] = 0.0,

				['xR'] = 120.0,
				['yR'] = 0.0,
				['zR'] = 180.0,
			}
		},
		['Accepter'] = {
			['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'pimpsex_punter', ['Flags'] = 1,
		},
	},
	{
		['Label'] = 'Contra la pared (de pie}',
		['RequesterLabel'] = 'contra la pared de ',
		['Requester'] = {
			['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'shagloop_hooker', ['Flags'] = 1, ['Attach'] = {
				['Bone'] = 9816,
				['xP'] = 0.05,
				['yP'] = 0.4,
				['zP'] = 0.0,

				['xR'] = 120.0,
				['yR'] = 0.0,
				['zR'] = 180.0,
			}
		},
		['Accepter'] = {
			['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'shagloop_pimp', ['Flags'] = 1,
		},
	},
	{
		['Label'] = 'Anal (de pie}', 
		['RequesterLabel'] = 'recibir anal de ',
		['Requester'] = {
			['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_a', ['Flags'] = 1,
		}, 
		['Accepter'] = {
			['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_poppy', ['Flags'] = 1, ['Attach'] = {
				['Bone'] = 9816,
				['xP'] = 0.015,
				['yP'] = 0.35,
				['zP'] = 0.0,

				['xR'] = 0.9,
				['yR'] = 0.3,
				['zR'] = 0.0,
			},
		},
	},
	{
		['Label'] = "Sexo (conductor}", 
		['RequesterLabel'] = 'ser follado por ',
		['Car'] = true,
		['Requester'] = {
			['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@vice@sex', ['Anim'] = 'frontseat_carsex_loop_m', ['Flags'] = 1,
		}, 
		['Accepter'] = {
			['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@vice@sex', ['Anim'] = 'frontseat_carsex_loop_f', ['Flags'] = 1,
		},
	},
	{
		['Label'] = "Sexo (recibir} (conductor}", 
		['RequesterLabel'] = 'fuck',
		['Car'] = true,
		['Requester'] = {
			['Type'] = 'animation', ['Dict'] = 'random@drunk_driver_2', ['Anim'] = 'cardrunksex_loop_f', ['Flags'] = 1,
		}, 
		['Accepter'] = {
			['Type'] = 'animation', ['Dict'] = 'random@drunk_driver_2', ['Anim'] = 'cardrunksex_loop_m', ['Flags'] = 1,
		},
	},
	{
		['Label'] = "Recibir felación (conductor}", 
		['RequesterLabel'] = 'hacer felación a ',
		['Car'] = true,
		['Requester'] = {
			['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'm_blow_job_loop', ['Flags'] = 1,
		}, 
		['Accepter'] = {
			['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'f_blow_job_loop', ['Flags'] = 1,
		},
	},
	-- NSFW animations ^^^^^^^
}

Config.SyncAnimations = {
	{
		name = 'synced',
		label = 'Animaciones sincronizadas',
		items = {
			{label = 'Saludos nigga', data = {lib = 'mp_ped_interaction', anim1 = 'hugs_guy_b', anim2 = 'hugs_guy_a', distans = 1.15, distans2 = 0.0, height = 0.0, spin = 180.0}},
			{label = 'Abrazo', data = {lib = 'mp_ped_interaction', anim1 = 'kisses_guy_b', anim2 = 'kisses_guy_b', distans = 1.10, distans2 = -0.1, height = 0.0, spin = 180.0}},
			{label = 'Abrazo cariñoso', data = {lib = 'mp_ped_interaction', anim1 = 'kisses_guy_a', anim2 = 'kisses_guy_a', distans = 1.15, distans2 = 0.0, height = 0.0, spin = 180.0}},
			{label = 'Dar la mano', data = {lib = 'mp_common', anim1 = 'givetake1_a', anim2 = 'givetake1_a', distans = 0.8, distans2 = 0.05, height = 0.0, spin = 180.0}},
			{label = 'Saludo amistoso', data = {lib = 'mp_ped_interaction', anim1 = 'highfive_guy_a', anim2 = 'highfive_guy_b', distans = 1.2, distans2 = -0.3, height = 0.0, spin = 180.0}},
		}
	}
}

