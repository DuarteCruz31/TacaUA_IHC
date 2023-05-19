import 'package:flutter/material.dart';
import 'package:tacaua/economia.dart';

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String _selectedModalidade = '-- Modalidade --';
  String _selectedCurso = '-- Curso --';
  String _selectedSexo = '-- Sexo --';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        _showFilterDialog(context);
      },
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filtrar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedModalidade,
                items: [
                  '-- Modalidade --',
                  'Futsal',
                  'Basket',
                  'Voleibol',
                  'Andebol',
                  'Badminton',
                  'Rugby',
                  'Ping Pong'
                ].map((modalidade) {
                  return DropdownMenuItem<String>(
                    value: modalidade,
                    child: Text(modalidade),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedModalidade = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Modalidade'),
              ),
              DropdownButtonFormField<String>(
                value: _selectedCurso,
                items: ['-- Curso --', 'EI', 'ET', 'CT', 'EB', 'AP', 'Economia']
                    .map((curso) {
                  return DropdownMenuItem<String>(
                    value: curso,
                    child: Text(curso),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCurso = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Curso'),
              ),
              DropdownButtonFormField<String>(
                value: _selectedSexo,
                items: ['-- Sexo --', 'Feminino', 'Masculino'].map((sexo) {
                  return DropdownMenuItem<String>(
                    value: sexo,
                    child: Text(sexo),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedSexo = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Sexo'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => EconomiaPage()));
              },
              child: Text('Filtrar'),
            ),
          ],
        );
      },
    );
  }

  void _applyFilter(String modalidade, String curso, String sexo) {
    // Implemente a lógica para aplicar o filtro com os parâmetros selecionados
    print('Filtro aplicado:');
    print('Modalidade: $modalidade');
    print('Curso: $curso');
    print('Sexo: $sexo');
  }
}
