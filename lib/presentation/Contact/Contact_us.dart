import 'package:dreamslanduae/presentation/componets/Contact/Text_field.dart';
import 'package:dreamslanduae/presentation/viewmodels/Contact/Submit_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends ConsumerStatefulWidget {
  const ContactSection({super.key});

  @override
  ConsumerState<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends ConsumerState<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = ref.watch(nameControllerProvider);
    final emailController = ref.watch(emailControllerProvider);
    final phoneController = ref.watch(phoneControllerProvider);
    final messageController = ref.watch(messageControllerProvider);
    final loading = ref.watch(loadingProvider);
    final submitStatus = ref.watch(submitStatusProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "Get In Touch",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "We're Here to Help You Find Your Dream Property Whether you're searching for a home "
            "in the tranquil beauty of Kerala or a luxury space in the heart of the UAE, our team "
            "is ready to assist you every step of the way.",
            textAlign: TextAlign.justify,
            style: GoogleFonts.nunito(
              color: Colors.grey,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 38),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isWide = constraints.maxWidth > 800;
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: isWide
                      ? IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 1,
                                child: _buildContactInfoBlock(),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: _buildFormBlock(
                                  nameController,
                                  emailController,
                                  phoneController,
                                  messageController,
                                  loading,
                                  submitStatus,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            _buildContactInfoBlock(),
                            const SizedBox(height: 20),
                            _buildFormBlock(
                              nameController,
                              emailController,
                              phoneController,
                              messageController,
                              loading,
                              submitStatus,
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }

  Widget _buildContactInfoBlock() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan[700],
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Information",
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          const ContactInfoLine(
            icon: Icons.phone_android,
            text: "+91 6238061066",
          ),
          const SizedBox(height: 20),
          const ContactInfoLine(
            icon: Icons.email_outlined,
            text: "info@dreamslandrealty.com",
          ),
          const SizedBox(height: 20),
          const ContactInfoLine(
            icon: Icons.home_work_outlined,
            text:
                "Thottathil House, Kanjoor Parappuram\nErnakulam District, 683575, Kerala, India",
          ),
          const SizedBox(height: 20),
          const ContactInfoLine(
            icon: Icons.home_max_sharp,
            text: "Angamaly Branch",
          ),
          const SizedBox(height: 20),
          const ContactInfoLine(
            icon: Icons.location_on_rounded,
            text:
                "ADAM CIRCLE, TB JUNCTION, ANGAMALY, Angamaly, Kerala 683572\n0484200639",
          ),
        ],
      ),
    );
  }

  Widget _buildFormBlock(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController messageController,
    bool loading,
    SubmitStatus? submitStatus,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              SizedBox(
                width: double.infinity,
                child: ReusableTextField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  icon: Icons.person,
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? "Name required" : null,
                  hint: "Name",
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ReusableTextField(
                  hint: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.g_mobiledata_rounded,
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? "Email required" : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ReusableTextField(
              controller: phoneController,
              icon: CupertinoIcons.phone,
              hint: "Contact Number",
              validator: (v) =>
                  v == null || v.trim().isEmpty ? "Phone required" : null,
              keyboardType: TextInputType.phone,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ReusableTextField(
              controller: messageController,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              hint: "Write your message",
              validator: (v) =>
                  v == null || v.trim().isEmpty ? "Message required" : null,
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[700],
                fixedSize: const Size(180, 50),
              ),
              onPressed: loading
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) return;

                      ref.read(loadingProvider.notifier).state = true;

                      try {
                        await ref
                            .read(contactServiceProvider)
                            .submitContactForm(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              phone: phoneController.text.trim(),
                              message: messageController.text.trim(),
                            );

                        ref
                            .read(submitStatusProvider.notifier)
                            .state = SubmitStatus(
                          success: true,
                          message: "Thank you! We'll get back to you soon.",
                        );

                        nameController.clear();
                        emailController.clear();
                        phoneController.clear();
                        messageController.clear();
                      } catch (e) {
                        ref
                            .read(submitStatusProvider.notifier)
                            .state = SubmitStatus(
                          success: false,
                          message: "Something went wrong. Please try again.",
                        );
                      }

                      ref.read(loadingProvider.notifier).state = false;
                    },

              child: loading
                  ?  SizedBox(
                      height: 26,
                      width: 26,
                      child: CircularProgressIndicator(
                        color: Colors.cyan[700],
                        strokeWidth: 0.5,
                      ),
                    )
                  : Text(
                      "Send message",
                      style: GoogleFonts.nunito(color: Colors.white),
                    ),
            ),
          ),
          if (submitStatus != null)
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                submitStatus.success
                    ? submitStatus.message
                    : "Sorry, your message could not be sent.",
                style: GoogleFonts.nunito(
                  color: submitStatus.success ? Colors.green : Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ContactInfoLine extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContactInfoLine({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: Colors.white70),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.nunito(color: Colors.white70, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
