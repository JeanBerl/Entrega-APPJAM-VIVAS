import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calcula valor do auxílio",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final numero_filhos = [
    "Selecione um valor",
    "Nenhum filho",
    "1 filho",
    "2 filhos",
    "3 filhos",
    "4 filhos",
    "5 filhos",
    "6 ou mais filhos"
  ];
  static final renda_familia = [
    "Selecione um valor",
    "Até 1 salário mínimo",
    "Até 2 salários mínimos",
    "Até 3 salários mínimos",
    "Mais que 4 salários mínimos"
  ];
  static final todos_os_fihos_vacinados = ["Selecione um valor", "Sim", "Não"];
  static final todos_os_fihos_na_escola = ["Selecione um valor", "Sim", "Não"];
  static final chefe_familia_mulher = ["Selecione um valor", "Sim", "Não"];
  String dropdownValue_renda_familia = renda_familia.first;
  String dropdownValue_numero_filhos = numero_filhos.first;
  String dropdownValue_todos_os_filhos_vacinados =
      todos_os_fihos_vacinados.first;
  String dropdownValue_todos_os_filhos_na_escola =
      todos_os_fihos_na_escola.first;
  String dropdownValue_chefe_familia_mulher = chefe_familia_mulher.first;
  String _textoResultado = "Preencha os dados.";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Saiba o valor do seu auxílio!"),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _resetFields();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Preencha os valores abaixo para saber o valor do seu auxílio:",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(children: [
                        Text(
                          "Número de filhos",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                      DropdownButton<String>(
                        value: dropdownValue_numero_filhos,
                        items: numero_filhos
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(width: 300.0, child: Text(value)),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            dropdownValue_numero_filhos = val!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            "Renda da família:",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                        DropdownButton<String>(
                          value: dropdownValue_renda_familia,
                          items: renda_familia
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(width: 300.0, child: Text(value)),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              dropdownValue_renda_familia = val!;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(children: [
                        Text(
                          "Todos os filhos vacinados?",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                      DropdownButton<String>(
                        value: dropdownValue_todos_os_filhos_vacinados,
                        items: todos_os_fihos_vacinados
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(width: 300.0, child: Text(value)),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            dropdownValue_todos_os_filhos_vacinados = val!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            "Todos os filhos na escola?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                        DropdownButton<String>(
                          value: dropdownValue_todos_os_filhos_na_escola,
                          items: todos_os_fihos_na_escola
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(width: 300.0, child: Text(value)),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              dropdownValue_todos_os_filhos_na_escola = val!;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(children: [
                        Text(
                          "Chefe da família é mulher solteira?",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                      DropdownButton<String>(
                        value: dropdownValue_chefe_familia_mulher,
                        items: chefe_familia_mulher
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(width: 300.0, child: Text(value)),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            dropdownValue_chefe_familia_mulher = val!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextButton(
                    onPressed: () {
                      if (!_campos_validos()){
                        setState(() {
                          _textoResultado = "Você deixou de preencher algum campo, preencha ele!";
                        });
                      }
                      else{
                        double valor_auxilio = calcula_valor_auxilio();
                        setState((){
                          _textoResultado = "O valor do seu auxílio é $valor_auxilio reais.";
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.deepOrange)),
                    child: Text(
                      "Calcular",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: FractionallySizedBox(
                    widthFactor: 0.4,
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(color: Colors.blueGrey),
                        child: Center(
                          child: Text(
                            '$_textoResultado',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ))),
              ),
            ],
          ),
        )));
  }

  void _resetFields() {
    _formKey = GlobalKey<FormState>();
    _textoResultado = "Preencha os dados.";
  }
  bool _campos_validos(){
    if (dropdownValue_chefe_familia_mulher == "Selecione um valor") return false;
    if (dropdownValue_todos_os_filhos_na_escola == "Selecione um valor") return false;
    if (dropdownValue_todos_os_filhos_vacinados == "Selecione um valor") return false;
    if (dropdownValue_numero_filhos == "Selecione um valor") return false;
    if (dropdownValue_renda_familia == "Selecione um valor") return false;
    return true;
  }
  double calcula_valor_auxilio(){
    double valor_auxilio = 0;
    double valor_salario_minimo = 1212;
    if (dropdownValue_numero_filhos == "Nenhum filho") return valor_auxilio;
    if (dropdownValue_chefe_familia_mulher == "Sim") valor_auxilio += 600;

    if (dropdownValue_renda_familia == "Mais que 4 salários mínimos" || dropdownValue_renda_familia == "Até 3 salários mínimos") return valor_auxilio;

    if (dropdownValue_todos_os_filhos_vacinados != "Sim" || dropdownValue_todos_os_filhos_na_escola != "Sim") return valor_auxilio;

    if (dropdownValue_numero_filhos == "Nenhum filho" || dropdownValue_numero_filhos == "1 filho" || dropdownValue_numero_filhos == "2 filhos"){
      if (dropdownValue_renda_familia == "Até 1 salário mínimo") valor_auxilio += valor_salario_minimo * 2.5;
      else if (dropdownValue_renda_familia == "Até 2 salários mínimos") valor_auxilio += valor_salario_minimo * 1.5;
    }
    else{
      if (dropdownValue_renda_familia == "Até 1 salário mínimo" || dropdownValue_renda_familia == "Até 2 salários mínimos") valor_auxilio += valor_salario_minimo * 3;
    }
    return valor_auxilio;
  }
}
