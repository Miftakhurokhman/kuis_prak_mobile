import 'package:flutter/material.dart';
import 'package:kuis_prak_mobile/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({super.key, required this.pokemon});

  final PokemonData pokemon;

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  String status = "tidak suka";
  bool suka = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(widget.pokemon.name,
                style:
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            ),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon((suka)?Icons.favorite:Icons.favorite_border),
            onPressed: (){
              String text = "";
              setState(() {
                if (status == "tidak suka") {
                  text = "Berhasil menambahkan ke favorit";
                  status = "suka";
                  suka = true;
                } else if (status == "suka") {
                  text = "Berhasil menghapus dari favorit";
                  status = "tidak suka";
                  suka = false;
                }
              });

              var snackBar = SnackBar(
                content: Text(text),
                backgroundColor:
                (suka) ? Colors.green : Colors.red,
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar);
            },
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Image.network(widget.pokemon.image),
        ),
        Center(
          child: Column(
            children: [
              Text(widget.pokemon.name, style:
              TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )
              ),
              SizedBox(height: 20,),
              Text("Type", style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.pokemon.type.isNotEmpty)
                Text(textAlign: TextAlign.center, widget.pokemon.type.toString()
                ),
              SizedBox(height: 10,),
              Text("Weakness", style:
              TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              if (widget.pokemon.weakness.isNotEmpty)
                Text(textAlign: TextAlign.center, widget.pokemon.weakness.toString()
                ),
              SizedBox(height: 10,),
              Text("Previus Evolution", style:
              TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              if (widget.pokemon.prevEvolution.isNotEmpty)
                Text(textAlign: TextAlign.center, widget.pokemon.prevEvolution.toString()
                ),
              SizedBox(height: 10,),
              Text("Next Evolution", style:
              TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              if (widget.pokemon.nextEvolution.isNotEmpty)
                Text(textAlign: TextAlign.center, widget.pokemon.nextEvolution.toString()
                ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcher('${widget.pokemon.wikiUrl}');
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("Gagal membuka url : $_url");
    }
  }
}
