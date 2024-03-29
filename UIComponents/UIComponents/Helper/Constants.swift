//
//  Constants.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

struct Constant {
    
    // MARK: String Constant
    struct String {
        
        static let placeHolderTxt = "Write your text here"
        static let rewinding = "Rewinding"
        static let playing = "Playing"
        static let pausing = "Pausing"
        static let forwarding = "Forwarding"
        static let url = "https://www.youtube.com/watch?v=S1QcTFzNSOo&ab_channel=CodingXpert"
        static let allDocuments = "All Documents"
        static let searchHolder = "Search Document"
        static let approved = "Approved"
        static let awaitingApproval = "Awaiting Approval"
        static let expandText = "Swift is a high-level general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community. First released in 2014,[10] Swift was developed as a replacement for Apple's earlier programming language Objective-C, as Objective-C had been largely unchanged since the early 1980s and lacked modern language features. Swift works with Apple's Cocoa and Cocoa Touch frameworks, and a key aspect of Swift's design was the ability to interoperate with the huge body of existing Objective-C code developed for Apple products over the previous decades. It was built with the open source LLVM compiler framework and has been included in Xcode since version 6, released in 2014. On Apple platforms,[11] it uses the Objective-C runtime library, which allows C, Objective-C, C++ and Swift code to run within one program."
        static let myName = "I'm Sagar"
        static let done = "Done"
        static let edit = "Edit"
        static let insert = "Insert"
        static let delete = "Delete"
        static let changeName = "Change Name"
        static let cancel = "Cancel"
        static let ok = "Ok"
        static let seeLess = "See Less"
        static let seeMore = "See More"
        static let popular = "Popular Jobs"
        static let recommanded = "Recommanded Jobs"
        static let featured = "Featured Jobs"
        static let annotationIdentifier = "annotationIdentifier"
        static let chatScreenTitle = "pontus gager"
        static let SignUpScreenTitle = "Create Profile"
        static let txtIceBreakerPlace = "Describe Yourself"
        static let txtBioPlace = "Enter your Bio"
        static let interests = "Interests"
        
    }
    
    // MARK: Storyboard Constant
    struct StoryBoard {
        
        static let homeScreen = "HomeScreen"
        static let jobScreen = "JobScreen"
        static let jobHomeScreen = "JobHomeScreen"
        static let task = "Task"
        static let navigation = "Navigation"
        
    }
     
    static let htmlString = """
        <!DOCTYPE html>
        <html>
        <head>
        <title>W3.CSS Template</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
        html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
        </style>
        </head>
        <body class="w3-light-grey">

        <!-- Page Container -->
        <div class="w3-content w3-margin-top" style="max-width:1400px;">

          <!-- The Grid -->
          <div class="w3-row-padding">
          
            <!-- Left Column -->
            <div class="w3-third">
            
              <div class="w3-white w3-text-grey w3-card-4">
                <div class="w3-display-container">
                  <img src="/w3images/avatar_hat.jpg" style="width:100%" alt="Avatar">
                  <div class="w3-display-bottomleft w3-container w3-text-black">
                    <h2>Jane Doe</h2>
                  </div>
                </div>
                <div class="w3-container">
                  <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>Designer</p>
                  <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>London, UK</p>
                  <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>ex@mail.com</p>
                  <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>1224435534</p>
                  <hr>

                  <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Skills</b></p>
                  <p>Adobe Photoshop</p>
                  <div class="w3-light-grey w3-round-xlarge w3-small">
                    <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:90%">90%</div>
                  </div>
                  <p>Photography</p>
                  <div class="w3-light-grey w3-round-xlarge w3-small">
                    <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:80%">
                      <div class="w3-center w3-text-white">80%</div>
                    </div>
                  </div>
                  <p>Illustrator</p>
                  <div class="w3-light-grey w3-round-xlarge w3-small">
                    <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:75%">75%</div>
                  </div>
                  <p>Media</p>
                  <div class="w3-light-grey w3-round-xlarge w3-small">
                    <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:50%">50%</div>
                  </div>
                  <br>

                  <p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>Languages</b></p>
                  <p>English</p>
                  <div class="w3-light-grey w3-round-xlarge">
                    <div class="w3-round-xlarge w3-teal" style="height:24px;width:100%"></div>
                  </div>
                  <p>Spanish</p>
                  <div class="w3-light-grey w3-round-xlarge">
                    <div class="w3-round-xlarge w3-teal" style="height:24px;width:55%"></div>
                  </div>
                  <p>German</p>
                  <div class="w3-light-grey w3-round-xlarge">
                    <div class="w3-round-xlarge w3-teal" style="height:24px;width:25%"></div>
                  </div>
                  <br>
                </div>
              </div><br>

            <!-- End Left Column -->
            </div>

            <!-- Right Column -->
            <div class="w3-twothird">
            
              <div class="w3-container w3-card w3-white w3-margin-bottom">
                <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Work Experience</h2>
                <div class="w3-container">
                  <h5 class="w3-opacity"><b>Front End Developer / w3schools.com</b></h5>
                  <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span class="w3-tag w3-teal w3-round">Current</span></h6>
                  <p>Lorem ipsum dolor sit amet. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
                  <hr>
                </div>
                <div class="w3-container">
                  <h5 class="w3-opacity"><b>Web Developer / something.com</b></h5>
                  <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Mar 2012 - Dec 2014</h6>
                  <p>Consectetur adipisicing elit. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
                  <hr>
                </div>
                <div class="w3-container">
                  <h5 class="w3-opacity"><b>Graphic Designer / designsomething.com</b></h5>
                  <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jun 2010 - Mar 2012</h6>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p><br>
                </div>
              </div>

              <div class="w3-container w3-card w3-white">
                <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Education</h2>
                <div class="w3-container">
                  <h5 class="w3-opacity"><b>W3Schools.com</b></h5>
                  <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Forever</h6>
                  <p>Web Development! All I need to know in one place</p>
                  <hr>
                </div>
                <div class="w3-container">
                  <h5 class="w3-opacity"><b>London Business School</b></h5>
                  <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2013 - 2015</h6>
                  <p>Master Degree</p>
                  <hr>
                </div>
                <div class="w3-container">
                  <h5 class="w3-opacity"><b>School of Coding</b></h5>
                  <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2010 - 2013</h6>
                  <p>Bachelor Degree</p><br>
                </div>
              </div>

            <!-- End Right Column -->
            </div>
            
          <!-- End Grid -->
          </div>
          
          <!-- End Page Container -->
        </div>

        <footer class="w3-container w3-teal w3-center w3-margin-top">
          <p>Find me on social media.</p>
          <i class="fa fa-facebook-official w3-hover-opacity"></i>
          <i class="fa fa-instagram w3-hover-opacity"></i>
          <i class="fa fa-snapchat w3-hover-opacity"></i>
          <i class="fa fa-pinterest-p w3-hover-opacity"></i>
          <i class="fa fa-twitter w3-hover-opacity"></i>
          <i class="fa fa-linkedin w3-hover-opacity"></i>
          <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
        </footer>

        </body>
        </html>
    """
    
    
}
