import 'package:TCC_II/Classes/Caracteristicas/CaracteristicaPersonalizada.dart';
import 'package:flutter/material.dart';
import 'package:TCC_II/Classes/Atividade.dart';

class ClasseNovaPergunta extends StatefulWidget {
  Atividade _atividade = new Atividade();
  ClasseNovaPergunta(this._atividade);

  @override
  CadastrarNovaPergunta createState() => CadastrarNovaPergunta();
}

class CadastrarNovaPergunta extends State<ClasseNovaPergunta> {
  TextEditingController _tecPergunta = new TextEditingController();
  TextEditingController _tecResposta = new TextEditingController();
  FocusNode _fnPergunta;
  FocusNode _fnResposta;

  void initState() {
    super.initState();
    dynamic pergunta = widget._atividade.getRespostaAtividade();

    if (pergunta != null) {
      _tecPergunta.text = pergunta.getPergunta();
      _tecResposta.text = pergunta.getResposta();
    }

    _fnPergunta = FocusNode();
    _fnResposta = FocusNode();
  }

  @override
  void dispose() {
    _fnPergunta.dispose();
    _fnResposta.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.green[300],
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                focusNode: _fnPergunta,
                controller: _tecPergunta,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite a sua pergunta*',
                  hintText: 'Qual é a cor da terra?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                focusNode: _fnResposta,
                controller: _tecResposta,
                maxLength: 150,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Resposta da sua pergunta*',
                  hintText: 'Azul, Preta, Marrom',
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 150,
                  child: FloatingActionButton.extended(
                    heroTag: "btCancelar",
                    label: Text(
                      "Cancelar",
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: FloatingActionButton.extended(
                    heroTag: "btGravar",
                    label: Text(
                      "Gravar",
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Colors.green,
                    onPressed: () {
                      if (_tecPergunta.text.isEmpty)
                        _fnPergunta.requestFocus();
                      else if (_tecResposta.text.isEmpty)
                        _fnResposta.requestFocus();
                      else {
                        widget._atividade.adicionaResposta(CaracteristicaPersonalizada(_tecPergunta.text, _tecResposta.text));
                        Navigator.pop(context, widget._atividade);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
