import 'package:flutter/material.dart';
import 'package:tacaua/economia.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String? _modalidade;
  String? _sexo;
  String? _curso;
  String? _dia;

  final List<String> _modalidades = ['Atletismo', 'Natação', 'Judo', 'Ciclismo', 'Boxe'];
  final List<String> _sexos = ['Feminino', 'Masculino'];
  final List<String> _cursos = ['Medicina', 'Engenharia', 'Direito', 'Artes', 'Economia'];
  final List<String> _dias = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta'];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.filter_list),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        _buildFilterRow('Modalidade', _modalidades, _modalidade, (String value) {
          setState(() {
            _modalidade = value;
          });
        }),
        _buildFilterRow('Sexo', _sexos, _sexo, (String value) {
          setState(() {
            _sexo = value;
          });
        }),
        _buildFilterRow('Curso', _cursos, _curso, (String value) {
          setState(() {
            _curso = value;
          });
        }),
        _buildFilterRow('Dia', _dias, _dia, (String value) {
          setState(() {
            _dia = value;
          });
        }),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          child: _buildFilterButton(),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildFilterRow(String label, List<String> options, String? value, void Function(String) onChanged) {
    return PopupMenuItem<String>(
      child: Row(
        children: [
          Text('$label: '),
          DropdownButton<String>(
            value: value,
            hint: Text(label),
            items: options
                .map<DropdownMenuItem<String>>((String option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
            onChanged: (String? newValue) {
              setState(() {
                onChanged(newValue!);
                _modalidade = newValue;
              });
            },
            underline: Container(),
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    return TextButton(
      child: Text('Filtrar'),
      onPressed: () {
        // Realizar a filtragem com os filtros selecionados
        print('Modalidade: $_modalidade, Sexo: $_sexo, Curso: $_curso, Dia: $_dia');
        Navigator.push(context, MaterialPageRoute(builder: (_) => EconomiaPage()));
      },
    );
  }
}