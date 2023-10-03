import 'package:flutter/material.dart';
import 'pokemon_data.dart';
import 'halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Text('Pokedex',
            style:
            TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount:3),
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          final PokemonData dataPokemon = listPokemon[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(pokemon: dataPokemon,),
                ),
              );
            },
            child: Card(
              child:SizedBox(
                height: 300,
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width/2,
                      child: Container(
                        child: Image.network(
                          dataPokemon.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      dataPokemon.name,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}