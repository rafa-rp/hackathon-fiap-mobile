import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  static const String id = '/form';

  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preencha sua Reclamação'),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ClaimForm()),
    );
  }
}

class ClaimForm extends StatefulWidget {
  @override
  _ClaimFormState createState() => _ClaimFormState();
}

class _ClaimFormState extends State<ClaimForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _title = '';
  String _channel = 'Aplicativo';
  int _selectedType = 0;
  String _claim = '';
  bool _termsChecked = true;

  List<DropdownMenuItem<int>> typeList = [];

  void loadTypeList() {
    typeList = [];
    typeList.add(const DropdownMenuItem(
      child: Text('Selecione o tipo de reclamação'),
      value: 0,
    ));
    typeList.add(const DropdownMenuItem(
      child: Text('Medicamentos'),
      value: 1,
    ));
    typeList.add(const DropdownMenuItem(
      child: Text('Hospitais'),
      value: 2,
    ));
    typeList.add(const DropdownMenuItem(
      child: Text('Plano de Saúde'),
      value: 3,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadTypeList();
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(TextFormField(
      decoration:
      const InputDecoration(labelText: 'Escreva seu nome', hintText: 'Nome'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, escreva um nome';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));

    validateTitle(String? value) {
      if (value!.isEmpty) {
        return 'Por favor, preencha o título';
      } else {
        return null;
      }
    }

    formWidget.add(TextFormField(
      decoration:
      const InputDecoration(labelText: 'Título da reclamação', hintText: 'Título'),
      validator: validateTitle,
      onSaved: (value) {
        setState(() {
          _title = value.toString();
        });
      },
    ));

    formWidget.add(DropdownButton(
      hint: const Text('Selecione o tipo'),
      items: typeList,
      value: _selectedType,
      onChanged: (value) {
        setState(() {
          _selectedType = int.parse(value.toString());
        });
      },
      isExpanded: true,
    ));

    formWidget.add(TextFormField(
      minLines: 8,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration:
      const InputDecoration(labelText: 'Escreva aqui sua reclamação', hintText: 'Reclamação'),
      validator: validateTitle,
      onSaved: (value) {
        setState(() {
          _claim = value.toString();
        });
      },
    ));

    formWidget.add(CheckboxListTile(
      value: _termsChecked,
      onChanged: (value) {
        setState(() {
          _termsChecked = value.toString().toLowerCase() == 'true';
        });
      },
      subtitle: !_termsChecked
          ? const Text(
        'Obrigatório',
        style: TextStyle(color: Colors.red, fontSize: 12.0),
      )
          : null,
      title: const Text(
        'Confirmar as informações',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    void onPressedSubmit() {
      if (_formKey.currentState!.validate() && _termsChecked) {
        _formKey.currentState?.save();

        print("Name " + _name);
        print("Title " + _title);
        switch (_selectedType) {
          case 0:
            print("");
            break;
          case 1:
            print("Medicamentos");
            break;
          case 2:
            print("Hospitais");
            break;
          case 3:
            print("Plano de Saúde");
            break;
        }
        print("Canal utilizado " + _channel);
        print("Reclamação: " + _claim);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Reclamação enviada')));
      }
    }

    formWidget.add(ElevatedButton(
        child: const Text('Enviar'), onPressed: onPressedSubmit));

    return formWidget;
  }

}