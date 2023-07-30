//
//  File.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 17/05/23.
//

struct JobModel {
    
    struct Job {
        
        let imgLogo: String
        let jobName: String
        let company: String
        let salary: String
        
        var tags: [String]?
        var location: String?
    }
    
    static let jobData = [
        Job(imgLogo: "jdribble", jobName: "UI Designer", company: "Dribbble", salary: "$80,000/y"),
        Job(imgLogo: "jfacebook", jobName: "UI Designer", company: "Facebook", salary: "$80,000/y"),
        Job(imgLogo: "jfirefox", jobName: "UI Designer", company: "Firefox", salary: "$80,000/y"),
        Job(imgLogo: "jpinterest", jobName: "UI Designer", company: "Pinterest", salary: "$80,000/y"),
        Job(imgLogo: "jspotify", jobName: "UI Designer", company: "Spotify", salary: "$80,000/y"),
        Job(imgLogo: "jubuntu", jobName: "UI Designer", company: "Ubuntu", salary: "$80,000/y"),
        Job(imgLogo: "jdribble", jobName: "UI Designer", company: "Dribbble", salary: "$80,000/y"),
    ]
    
    // MARK: Job Second Screen
    static let keys = Array(jobDictionary.keys)
    
    static let jobDictionary: [String: [Job]] = [
        "recommanded": [
            Job(imgLogo: "jdribble", jobName: "UI Designer", company: "Dribbble", salary: "$80,000/y"),
            Job(imgLogo: "jfacebook", jobName: "UI Designer", company: "Facebook", salary: "$80,000/y"),
            Job(imgLogo: "jpinterest", jobName: "UI Designer", company: "Pinterest", salary: "$80,000/y"),
            Job(imgLogo: "jspotify", jobName: "UI Designer", company: "Spotify", salary: "$80,000/y"),
        ],
        "popular": [
            Job(imgLogo: "jfirefox", jobName: "UI Designer", company: "Firefox", salary: "$80,000/y"),
            Job(imgLogo: "jubuntu", jobName: "UI Designer", company: "Ubuntu", salary: "$80,000/y"),
            Job(imgLogo: "jubuntu", jobName: "UI Designer", company: "Ubuntu", salary: "$80,000/y"),
            Job(imgLogo: "jubuntu", jobName: "UI Designer", company: "Ubuntu", salary: "$80,000/y"),
            Job(imgLogo: "jubuntu", jobName: "UI Designer", company: "Ubuntu", salary: "$80,000/y"),
            Job(imgLogo: "jubuntu", jobName: "UI Designer", company: "Ubuntu", salary: "$80,000/y"),
        ]
    ]
    
    // MARK: Job Home Screen
    static let jobHomeDictionary: [String: [Job]] = [
        "featured": [
            Job(imgLogo: "jshell", jobName: "Junior Executive", company: "Shell", salary: "$80,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jfacebook", jobName: "Junior Executive", company: "Facebook", salary: "$$96,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jshell", jobName: "Junior Executive", company: "Shell", salary: "$80,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jfacebook", jobName: "Junior Executive", company: "Facebook", salary: "$$96,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jshell", jobName: "Junior Executive", company: "Shell", salary: "$80,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jfacebook", jobName: "Junior Executive", company: "Facebook", salary: "$$96,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jshell", jobName: "Junior Executive", company: "Shell", salary: "$80,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),
            Job(imgLogo: "jfacebook", jobName: "Junior Executive", company: "Facebook", salary: "$$96,000/y", tags: ["Administration", "Full-Time", "Junior"], location: "Texas, USA"),

            ],
        "popular": [
            Job(imgLogo: "jfirefox", jobName: "UI Designer", company: "Firefox", salary: "$80,000/y"),
            Job(imgLogo: "jfacebook", jobName: "UI Designer", company: "Facebook", salary: "$80,000/y"),
            Job(imgLogo: "jfirefox", jobName: "UI Designer", company: "Firefox", salary: "$80,000/y"),
            Job(imgLogo: "jfacebook", jobName: "UI Designer", company: "Facebook", salary: "$80,000/y"),
            Job(imgLogo: "jfirefox", jobName: "UI Designer", company: "Firefox", salary: "$80,000/y"),
            Job(imgLogo: "jfacebook", jobName: "UI Designer", company: "Facebook", salary: "$80,000/y"),
        ]

    ]
     
}
