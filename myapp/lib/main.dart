import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final birthDateController = TextEditingController();
  final birthPlaceController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final nationalityController = TextEditingController();
  final religionController = TextEditingController();
  final civilStatusController = TextEditingController();
  final educationController = TextEditingController();
  final schoolController = TextEditingController();
  final courseController = TextEditingController();
  final skillsController = TextEditingController();

  String gender = 'Male';

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    birthDateController.dispose();
    birthPlaceController.dispose();
    addressController.dispose();
    contactController.dispose();
    emailController.dispose();
    nationalityController.dispose();
    religionController.dispose();
    civilStatusController.dispose();
    educationController.dispose();
    schoolController.dispose();
    courseController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: required
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              }
            : null,
      ),
    );
  }

  void submitBiodata() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text('Biodata Submitted'),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${firstNameController.text} '
                    '${middleNameController.text} '
                    '${lastNameController.text}',
                  ),
                  const SizedBox(height: 8),
                  Text('Age: ${ageController.text}'),
                  Text('Gender: $gender'),
                  Text('Birth Date: ${birthDateController.text}'),
                  Text('Birth Place: ${birthPlaceController.text}'),
                  const SizedBox(height: 8),
                  Text('Address: ${addressController.text}'),
                  Text('Contact: ${contactController.text}'),
                  Text('Email: ${emailController.text}'),
                  const SizedBox(height: 8),
                  Text('Nationality: ${nationalityController.text}'),
                  Text('Religion: ${religionController.text}'),
                  Text('Civil Status: ${civilStatusController.text}'),
                  const SizedBox(height: 8),
                  Text('Education: ${educationController.text}'),
                  Text('School: ${schoolController.text}'),
                  Text('Course: ${courseController.text}'),
                  Text('Skills: ${skillsController.text}'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('CLOSE'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biodata Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 10),

              const Text(
                'PERSONAL BIODATA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Please fill out your information',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              // PERSONAL INFORMATION
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildTextField(
                        controller: firstNameController,
                        label: 'First Name',
                        icon: Icons.person,
                      ),

                      buildTextField(
                        controller: middleNameController,
                        label: 'Middle Name',
                        icon: Icons.person_outline,
                        required: false,
                      ),

                      buildTextField(
                        controller: lastNameController,
                        label: 'Last Name',
                        icon: Icons.person,
                      ),

                      buildTextField(
                        controller: ageController,
                        label: 'Age',
                        icon: Icons.numbers,
                        keyboardType: TextInputType.number,
                      ),

                      DropdownButtonFormField<String>(
                        value: gender,
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          prefixIcon: const Icon(Icons.wc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 16),

                      buildTextField(
                        controller: birthDateController,
                        label: 'Birth Date',
                        icon: Icons.calendar_today,
                      ),

                      buildTextField(
                        controller: birthPlaceController,
                        label: 'Birth Place',
                        icon: Icons.location_on,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CONTACT INFORMATION
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildTextField(
                        controller: addressController,
                        label: 'Complete Address',
                        icon: Icons.home,
                        maxLines: 2,
                      ),

                      buildTextField(
                        controller: contactController,
                        label: 'Contact Number',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),

                      buildTextField(
                        controller: emailController,
                        label: 'Email Address',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // OTHER INFORMATION
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Other Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildTextField(
                        controller: nationalityController,
                        label: 'Nationality',
                        icon: Icons.flag,
                      ),

                      buildTextField(
                        controller: religionController,
                        label: 'Religion',
                        icon: Icons.church,
                      ),

                      buildTextField(
                        controller: civilStatusController,
                        label: 'Civil Status',
                        icon: Icons.family_restroom,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // EDUCATIONAL BACKGROUND
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Educational Background',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildTextField(
                        controller: educationController,
                        label: 'Educational Attainment',
                        icon: Icons.school,
                      ),

                      buildTextField(
                        controller: schoolController,
                        label: 'School / University',
                        icon: Icons.account_balance,
                      ),

                      buildTextField(
                        controller: courseController,
                        label: 'Course / Program',
                        icon: Icons.menu_book,
                      ),

                      buildTextField(
                        controller: skillsController,
                        label: 'Skills',
                        icon: Icons.star,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: submitBiodata,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'SUBMIT BIODATA',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}