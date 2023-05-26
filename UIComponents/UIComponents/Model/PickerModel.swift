//
//  PickerModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 25/05/23.
//

struct PickerModel {
    
    static let date = Array(1...31).map { String($0) }

    static let month = ["January","Febrary","March","April","May","June","July","August","September","October","November","December"]
    
    static let pickLanguage = [
        "programmingLang": ["Swift", "Python", "Java", "JavaScript", "C++", "C", "Ruby", "PHP", "Perl", "Go"],
        "regionalLang": ["Afrikaans", "Albanian", "Amharic", "Arabic", "Armenian", "Assamese", "Azerbaijani", "Basque", "Bengali", "Bosnian", "Bulgarian", "Burmese", "Catalan", "Cebuano", "Chichewa", "Chinese (Simplified)", "Chinese (Traditional)", "Chhattisgarhi", "Croatian", "Czech", "Danish", "Dutch", "Dzongkha", "English", "Esperanto", "Estonian", "Filipino", "Finnish", "French", "Frisian", "Galician", "Georgian", "German", "Greek", "Gujarati", "Haitian Creole", "Hausa", "Hebrew", "Hindi", "Hmong", "Hungarian", "Icelandic", "Igbo", "Indonesian", "Irish", "Italian", "Japanese", "Javanese", "Kannada", "Kazakh", "Khmer", "Kirghiz", "Korean", "Kurdish", "Kyrgyz", "Lao", "Latin", "Latvian", "Lithuanian", "Luxembourgish", "Macedonian", "Malagasy", "Malay", "Maltese", "Marathi", "Mongolian", "Myanmar (Burmese)", "Nepali", "Norwegian", "Odia (Oriya)", "Pashto", "Persian", "Polish", "Portuguese", "Punjabi", "Romanian", "Russian", "Saami", "Samoan", "Sinhalese", "Slovak", "Slovenian", "Somali", "Spanish", "Swahili", "Swedish", "Tagalog", "Tamil", "Tatar", "Telugu", "Thai", "Tibetan", "Tigrinya", "Tonga", "Turkish", "Turkmen", "Ukrainian", "Urdu", "Uzbek", "Vietnamese", "Welsh", "Xhosa", "Yiddish", "Zulu"]
    ]

}
