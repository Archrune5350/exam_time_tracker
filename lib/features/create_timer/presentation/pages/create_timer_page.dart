import 'package:exam_time_tracker/core/constants/app_strings.dart';
import 'package:exam_time_tracker/features/create_timer/logic/member_manager.dart';
import 'package:exam_time_tracker/features/create_timer/logic/time_input_formatter.dart';
import 'package:exam_time_tracker/features/create_timer/logic/timer_manager.dart';
import 'package:exam_time_tracker/features/timer/data/models/timer_data.dart';
import 'package:exam_time_tracker/features/timer/presentation/pages/timer_page.dart';
import 'package:exam_time_tracker/shared/widgets/custom_card.dart';
import 'package:exam_time_tracker/features/create_timer/presentation/widgets/custom_text_field.dart';
import 'package:exam_time_tracker/shared/widgets/custom_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTimerPage extends StatefulWidget {
  const CreateTimerPage({super.key});

  @override
  State<CreateTimerPage> createState() => _CreateTimerPageState();
}

class _CreateTimerPageState extends State<CreateTimerPage> {
  final nameController = TextEditingController();
  final examTimeController = TextEditingController();
  final timerManager = TimerManager();
  final memberManager = MemberManager();
  final TextEditingController fixedMember1Controller = TextEditingController();
  final TextEditingController fixedMember2Controller = TextEditingController();
  bool isGroupEnabled = false;

  @override
  void dispose() {
    nameController.dispose();
    examTimeController.dispose();
    memberManager.dispose();
    super.dispose();
  }

  void handleSave() {
    final allMembers = <String>[
      fixedMember1Controller.text,
      fixedMember2Controller.text,
      ...memberManager.controllers.map((c) => c.text),
    ];

    timerManager.saveTimer(
      name: nameController.text, 
      isGroup: isGroupEnabled, 
      members: allMembers, 
      examTime: examTimeController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = CreateTimerStrings(context);
    const double spaceFromSides = 12.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.createTimer),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          const CustomSpacing(SpacingType.element),
      
          CustomCard(
            child: CustomTextField(
              controller: nameController, 
              label: strings.timerName,
              hint: 'Mathematics exam',
            )
          ),
      
          const CustomSpacing(SpacingType.element),
      
          CustomCard(
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text(strings.groupTimer),
              trailing: Switch(
                value: isGroupEnabled,
                onChanged: (value) {
                  setState(() {
                    isGroupEnabled = value;
                  });
                }
              ),
            ),
          ),
      
          const CustomSpacing(SpacingType.element),
      
          if (isGroupEnabled) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(strings.groupMembers),
      
                const CustomSpacing(SpacingType.text),
      
                CustomCard(
                  child: CustomTextField(
                    controller: fixedMember1Controller, 
                    label: strings.name,
                    hint: 'Maria',
                    inputFormat: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZæøåÆØÅ ]+'))
                    ],
                  )
                ),
      
                const CustomSpacing(SpacingType.element),
            
                CustomCard(
                  child: CustomTextField(
                    controller: fixedMember2Controller, 
                    label: strings.name,
                    hint: 'Peter',
                    inputFormat: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZæøåÆØÅ ]+'))
                    ],
                  ),
                ),
      
                for (var i = 0; i < memberManager.members.length; i++) ...[
      
                  const CustomSpacing(SpacingType.element),
      
                  Dismissible(
                    key: Key(memberManager.members[i].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      setState(() {
                        memberManager.removeMember(memberManager.members[i], () {});
                      });
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: spaceFromSides),
                      child: const Icon(Icons.delete),
                    ),
                    child: CustomCard(
                      child: CustomTextField(
                        controller: memberManager.controllers[i], 
                        label: strings.name,
                        hint: 'Jessica',
                        inputFormat: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZæøåÆØÅ ]+'))
                        ],
                      ),
                    ),
                  )
                ],
      
                if (memberManager.members.length < 2) ...[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        memberManager.addMember(() {});
                      });
                    },
                    icon: Icon(Icons.add)
                  )
                ],
              ],
            ),
          ],
      
          const CustomSpacing(SpacingType.element),
      
          Center(child: Text(strings.examTime)),
      
          const CustomSpacing(SpacingType.text),
      
          CustomCard(
            child: CustomTextField(
              controller: examTimeController, 
              label: strings.time,
              hint: '01:00:00',
              inputFormat: [
                TimeInputFormatter(),
                LengthLimitingTextInputFormatter(8),
              ],
            )
          ),
      
          const CustomSpacing(SpacingType.element),

          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerPage(timerData: TimerData(
                      id: '0', 
                      name: 'Mathematics',
                      isGroup: true, 
                      members: ['Simon', 'Jessica'], 
                      examTime: '00:30:00', 
                      createdAt: DateTime.now(),
                    ))),
                  );
                },
                child: Center(child: Text('Create timer'))
              ),
            ),
          )
        ],
      ),
    );
  }
}