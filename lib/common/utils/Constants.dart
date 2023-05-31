import 'package:doctor_247/features/doctor_category/domain/models/doctor_category.dart';
import 'package:doctor_247/features/home_page/domain/model/main_category.dart';

class Constants{
  Constants._();


  static const String doctorsCollection = 'doctors';
  static const String physiotherapyCollection = 'physiotherapy';
  static const String ambulancesCollection = 'ambulances';
  static const String diagnosticCollection = 'diagnostic';
  static const String bloodBankCollection = 'blood_bank';
  static const String hospitalsCollection = 'hospitals';
  static const String configCollection = 'config';
  static const String doctorsChamberCollection = 'chambers';
  static const String hearingCentersCollection = 'hearing_centers';


  static const String doctorPlaceHolder = 'https://www.northernmed.com/wp-content/uploads/2020/12/headshot-placeholder-01.jpg';

  static List<MainCategory> mainCategories = [
    const MainCategory('ডাক্তার', 'doctor','assets/pictures/doctor.png',),
    const MainCategory('ডায়াগনস্টিক সেন্টার', 'diagnostic', 'assets/pictures/diagnostic.png',),
    const MainCategory('হাসপাতাল / ক্লিনিক','clinic', 'assets/pictures/hospital.png',),
    const MainCategory('এম্বুলেন্স','ambulance', 'assets/pictures/ambulance.png',),
    const MainCategory('ব্লাড ব্যাংক', 'blood','assets/pictures/blood_bank.png',),
    const MainCategory('ফিজিওথেরাপি', 'physiotherapy','assets/pictures/physiotherapy.png',),
    const MainCategory('হিয়ারিং সেন্টার','hearing', 'assets/pictures/medical.png',),
    const MainCategory('ভিডিও কনসাল্টেশন', 'video','assets/pictures/video.png',),
    const MainCategory('অন্যান্য','others', 'assets/pictures/others.png',),
  ];
  
  
  static List<DoctorCategory> doctorCategories = [
    const DoctorCategory('মেডিসিন', 'medicine', 'assets/pictures/medicine.png'),
    const DoctorCategory('হৃদরোগ', 'heart', 'assets/pictures/heart.png'),
    const DoctorCategory('জেনারেল ও ল্যাপারোস্কপিক সার্জন', 'surgeon', 'assets/pictures/surgeon.png'),
    const DoctorCategory('প্রসূতি ও স্ত্রীরোগ', 'gynecology', 'assets/pictures/gynecology.png'),
    const DoctorCategory('নাক,কান ও গলা', 'NJT', 'assets/pictures/njt.png'),
    const DoctorCategory('শিশু ও কিশোর', 'child', 'assets/pictures/child.png'),
    const DoctorCategory('শিশু ও কিশোর সার্জন', 'child_surgeon', 'assets/pictures/child_surgeon.png'),
    const DoctorCategory('ডায়াবেটিস ও হরমোন', 'diabetics', 'assets/pictures/diabetics.png'),
    const DoctorCategory('লিভার, গ্যাস্টোএন্টোলজি ও পরিপাকতন্ত্র', 'liver', 'assets/pictures/liver.png'),
    const DoctorCategory('বাত, ব্যাথা ও প্যারালাইসিস', 'paralysis', 'assets/pictures/p.png'),
    const DoctorCategory('কিডনি রোগ', 'kidney', 'assets/pictures/kidney.png'),
    const DoctorCategory('ইউরোলজি', 'urology', 'assets/pictures/urology.png'),
    const DoctorCategory('নিউরো মেডিসিন', 'neuro_medicine', 'assets/pictures/neuro_medicine.png'),
    const DoctorCategory('নিউরো সার্জন', 'neuro surgeon', 'assets/pictures/neuro_surgeon.png'),
    const DoctorCategory('কলোরেক্টাল সার্জন (পাইলস)', 'piles', 'assets/pictures/piles.png'),
    const DoctorCategory('এ্যাজমা, বক্ষব্যাধি ও যক্ষা', 'chest', 'assets/pictures/chest.png'),
    const DoctorCategory('ক্যান্সার', 'cancer', 'assets/pictures/cancer.png'),
    const DoctorCategory('চক্ষু রোগ', 'eye', 'assets/pictures/eye.png'),
    const DoctorCategory('মুখ ও দন্ত রোগ', 'dentist', 'assets/pictures/dentist.png'),
    const DoctorCategory('চর্ম ও যৌন রোগ', 'skin', 'assets/pictures/skin.png'),
    const DoctorCategory('ফিজিক্যাল মেডিসিন', 'physical', 'assets/pictures/physical_medicine.png'),
    const DoctorCategory('বার্ন ও প্লাস্টিক সার্জন', 'burn', 'assets/pictures/burn.png'),
    const DoctorCategory('রক্তরোগ', 'blood', 'assets/pictures/blood.png'),
    const DoctorCategory('মনোরোগ', 'psychology', 'assets/pictures/psychology.png'),
    const DoctorCategory('ফিজিওথেরাপি', 'physiotherapy', 'assets/pictures/physiotherapy.png'),
    const DoctorCategory('ডায়েটিশিয়ান ও পুষ্টিবিদ', 'diet', 'assets/pictures/diet.png'),
  ];
}