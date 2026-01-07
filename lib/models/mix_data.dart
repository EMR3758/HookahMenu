import 'package:hookah_menu/models/mix_model.dart';

List<MixModel> mixes = [
  MixModel(
    id: "tropical_sunrise",
    name: "Tropical Sunrise",
    description:
        "Taze mango, olgun şeftali ve tatlı-ekşi narenciye aromalarının ferahlatıcı bir karışımı. Turbo Tea’nin hafif baharatlı ve buzlu şeftali dokunuşu ile tropikal ve canlı bir içim deneyimi sunar.",
    ingredients: {
      "erics_mango": 0.3,
      "orange_team": 0.2,
      "sweet_peach": 0.3,
      "turbo_tea": 0.2,
    },
    intensity: 7,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "tropical_fusion",
    name: "Tropical Fusion",
    description:
        "Tropikal ananas, olgun şeftali ve ferah lime aromalarının enerjik karışımı. LemonBlast’in keskin narenciye dokunuşu ile canlı ve dengeli bir içim sunar.",
    ingredients: {
      "ananas_shock": 0.4,
      "brazilian_tea": 0.2,
      "lemon_blast": 0.1,
      "moon_peach": 0.3,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "sweet_indulgence",
    name: "Sweet Indulgence",
    description:
        "Kremamsı waffle, çikolatalı brownie ve karamelize fıstık aromalarının tatlı ve zengin karışımı. Deep Blue Sea’nin hafif mavi meyve dokunuşu ile ferah ve dengeli bir içim deneyimi sunar.",
    ingredients: {
      "creamy_waffle": 0.3,
      "brownie": 0.4,
      "deep_blue_sea": 0.1,
      "monkey_nuts": 0.2,
    },
    intensity: 8,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Cigar",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "tropical_harmony",
    name: "Tropical Harmony",
    description:
        "Tropikal mango ve ananas, olgun erik, ferah lime çayı ve tatlı çileğin dengeli karışımı. Tropik meyve aromaları ve Strawberry’nin sulu dokunuşu ile canlı ve tatlı bir içim deneyimi sunar.",
    ingredients: {
      "pineapple_mango": 0.4,
      "passion_plum": 0.2,
      "brazilian_tea": 0.1,
      "tropic_juice": 0.2,
      "strawberry": 0.1,
    },
    intensity: 5,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "citrus_brownie",
    name: "Citrus Brownie",
    description:
        "Zengin çikolata ve kek aroması, kremalı limon tart ve canlı portakal dokunuşlarıyla tatlı ve ferah bir karışım. Pastene aromalarının dengeli birleşimi ile keyifli bir içim sunar.",
    ingredients: {
      "browni": 0.6,
      "lemon_pie": 0.2,
      "lemon": 0.1,
      "orange_team": 0.1,
    },
    intensity: 8,
    isFavorite: false,
    mixType: "Pastene",
    mixTobaccoType: "Dark",
    mixWeight: 100,
    similarMixes: [],
  ),

  MixModel(
    id: "fruity_symphony",
    name: "Fruity Symphony",
    description:
        "Tropikal passion fruit, olgun şeftali, tatlı çilek ve canlı portakal aromalarının dengeli karışımı. Ferah ve sulu meyve dokunuşlarıyla tropikal bir içim deneyimi sunar.",
    ingredients: {
      "passion_fruits": 0.6,
      "moon_peach": 0.2,
      "strawberry": 0.1,
      "orange_team": 0.1,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 100,
    similarMixes: [],
  ),

  MixModel(
    id: "exotic_paradise",
    name: "Exotic Paradise",
    description:
        "Tropikal mango, ananas, olgun şeftali ve egzotik meyvelerin enerjik karışımı. Supernova’nın patlayıcı meyve dokunuşları ile ferah ve tropikal bir içim deneyimi sunar.",
    ingredients: {
      "jungle_mix": 0.3,
      "sweet_peach": 0.3,
      "pineapple_mango": 0.3,
      "supernova": 0.1,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 100,
    similarMixes: [],
  ),

  MixModel(
    id: "citrus_noir",
    name: "Citrus Noir",
    description:
        "Ekşi narenciye, tropikal meyveler ve baharatlı Kaşmir dokunuşlarıyla canlı ve dengeli bir karışım. Pinkman’ın serin meyve aroması ile ferah ve ekşimsi bir içim deneyimi sunar.",
    ingredients: {"citrus_mix": 0.4, "kashmir_black": 0.4, "pinkman": 0.2},
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "kremali_waffle_ruyasi",
    name: "Kremalı Waffle Rüyası",
    description:
        "Kremamsı waffle, çikolatalı brownie ve yumuşak puding aromalarının muazzam uyumu. Zengin ve tatlı pastene tatlarıyla dengeli bir içim deneyimi sunar.",
    ingredients: {"brownie": 0.4, "pudding": 0.3, "creamy_waffle": 0.3},
    intensity: 6,
    isFavorite: false,
    mixType: "Pastene",
    mixTobaccoType: "Cigar",
    mixWeight: 6,
    similarMixes: [],
  ),
  MixModel(
    id: "plombir_dejavu_mix",
    name: "Dondurma Deja Vu",
    description:
        "Kremamsı dondurma ve vanilya aromaları ile ferahlatıcı kavun‑karpuz notalarının buluştuğu tatlı ve hafif bir karışım deneyimi.",
    ingredients: {"plombir": 0.4, "dejavu": 0.6},
    intensity: 3,
    isFavorite: false,
    mixType: "Pastene",
    mixTobaccoType: "Blonde",
    mixWeight: 6,
    similarMixes: [],
  ),
];
