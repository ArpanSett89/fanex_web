import 'package:fanex_web/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../common/widgets/footer/footer_ui.dart';
import '../../../common/widgets/scroll_control_button/scroll_control_button.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  final ScrollController _scrollController = ScrollController();
  var _isVisibleForScrollView = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          if (_isVisibleForScrollView) {
            setState(() {
              _isVisibleForScrollView = false;
            });
          }
        }
      } else {
        if (!_isVisibleForScrollView) {
          setState(() {
            _isVisibleForScrollView = true;
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.78),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage(
                      'assets/images/contect_banner.png'),
                  fit: BoxFit.contain)),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(AppSizes.dimen16),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/fanex_logo.png',
                    width: 170,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                    padding: EdgeInsets.zero,
                    onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.clear,color: AppColors.white,size: AppSizes.headline1,)),
              ],
          ),
            ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppSizes.cardCornerRadius),
                    color: AppColors.white),
                padding: const EdgeInsets.all(AppSizes.dimen24),
                margin:  EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                child: Html(
                  data:
                      r"""<div><h1 class="text-center" style="box-sizing: border-box; font-family: Oswald, sans-serif; transition: all 0.3s linear 0s; margin-top: 0px; margin-bottom: 15px; line-height: 32px; font-size: 30px; text-transform: uppercase; color: rgb(54, 61, 79); padding-top: 20px; text-align: center !important;">
	Terms Of Use</h1>
<p>
	Last Updated: December 31, 2019</p>
<p>
	Effective: January 2, 2020</p>
<h2>
	1. FanEx</h2>
<p>
	The Fan Exchange is the flagship brand of FanEx Fantasy Private Limited ("FanEx" or “the Company”). Through The Fan Exchange Website, along with its sub-pages, and The Fan Exchange Application, FanEx operates a portal through which it offers cricket based online fantasy games. FanEx as used herein shall be construed as a collective reference to The Fan Exchange Website and The Fan Exchange Application.</p>
<h2>
	2. Usage of FanEx</h2>
<p>
	Any person ("<b>User</b>" or “<b>Participant</b>”) accessing FanEx for participating in the various contests and games ("Contest(s)") or any promotion, shall be bound by these Terms of Use, and all other rules, regulations and terms and conditions referred to herein or provided by FanEx in relation to any Contest or promotion.</p>
<p>
	FanEx shall be entitled to modify these Terms of Use, rules, and regulations referred to herein or provided by FanEx in relation to any Contest or promotion, at any time, by posting the same on FanEx. Use of FanEx constitutes the User's acceptance of such Terms of Use, rules, and regulations referred to herein or provided by FanEx in relation to any Contest or promotion, as may be amended from time to time. FanEx may, at its sole discretion, also notify the User of any change or modification in these Terms of Use, rules, and regulations referred to herein or provided by FanEx, by way of sending an email to the User's registered email address or, if no email address was provided by the User, posting a notification in the User’s account. The User may then exercise the options provided in such an email or notification to indicate non-acceptance of the modified Terms of Use rules, and regulations referred to herein or provided by FanEx. If such options are not exercised by the User within the time frame prescribed in the email or notification, the User will be deemed to have accepted the modified Terms of Use, rules, and regulations referred to herein or provided by FanEx.</p>
<p>
	Certain Contests or promotions being provided on FanEx may be subject to additional rules and regulations set down in that respect. To the extent that these Terms of Use are inconsistent with the additional conditions set down, the additional conditions shall prevail.</p>
<p>
	FanEx may, at its sole and absolute discretion:</p>
<ul>
	<li>
		Restrict, suspend, or terminate any User's access to all or any part of FanEx;</li>
	<li>
		Change, suspend, or discontinue all or any part of FanEx;</li>
	<li>
		Reject, move, or remove any material that may be submitted by a User;</li>
	<li>
		Move or remove any content that is available on FanEx;</li>
	<li>
		Deactivate or delete a User's account and all related information and files on the account;</li>
	<li>
		Establish general practices and limits concerning use of FanEx;</li>
	<li>
		Revise or make additions and/or deletions to the roster of players available for selection in a Contest on account of revisions to the roster of players involved in the relevant Sports Event;</li>
	<li>
		Assign its rights and liabilities to all User accounts hereunder to any entity (post such assignment intimation of such assignment shall be sent to all Users to their registered email address or, if no email address was provided by the User, posting a notification in the User’s account)</li>
</ul>
<p>
	In the event any User breaches, or the Company reasonably believes that such User has breached these Terms of Use, or has illegally or improperly used FanEx, the Company may, at its sole and absolute discretion, and without any notice to the User, restrict, suspend or terminate such User's access to all or any part of FanEx Contests, deactivate or delete the User's account and all related information on the account, delete any content posted by the User on FanEx and further, take technical and legal steps as it deems necessary.</p>
<p>
	If the Company charges its Users a commission in respect of any Contest, FanEx shall repay such commission in the event of suspension or removal of the User's account that is due to any negligence or deficiency on the part of FanEx, but not if such suspension or removal is effected due to:</p>
<ul>
	<li>
		any breach or inadequate performance by the User of any of these Terms of Use; or</li>
	<li>
		any circumstances beyond the reasonable control of FanEx.</li>
</ul>
<p>
	Users consent to receiving communications such as announcements, administrative messages and advertisements from FanEx or any of its partners, licensors or associates.</p>
<h2>
	3. Intellectual Property</h2>
<p>
	FanEx includes a combination of content created by the Company, its partners, affiliates, licensors, associates and/or Users. The intellectual property rights ("Intellectual Property Rights") in all software underlying FanEx and material published on FanEx, including (but not limited to) games, Contests, software, advertisements, written content, photographs, graphics, images, illustrations, marks, logos, audio or video clippings and Flash animation, is owned by FanEx, its partners, licensors and/or associates. Users may not modify, publish, transmit, participate in the transfer or sale of, reproduce, create derivative works of, distribute, publicly perform, publicly display, or in any way exploit any of the materials or content on FanEx either in whole or in part without express written license from FanEx.</p>
<p>
	Users may request permission to use any FanEx content in writing by emailing <a href="mailto:support@fanex.in">support@fanex.in</a>.</p>
<p>
	Users are solely responsible for all materials (whether publicly posted or privately transmitted) that they upload, post, e-mail, transmit, or otherwise make available on FanEx ("<b>Users' Content</b>"). Each User represents and warrants that he/she owns all Intellectual Property Rights in the User's Content and that no part of the User's Content infringes upon any third party rights. Users further confirm and undertake to not display or use of the names, logos, marks, labels, trademarks, copyrights or intellectual and proprietary rights of any third party on FanEx. Users agree to indemnify and hold harmless FanEx, its directors, employees, affiliates and assigns against all costs, damages, loss and harm including towards litigation costs and counsel fees, in respect of any third party claims that may be initiated including for infringement of Intellectual Property Rights arising out of such display or use of the names, logos, marks, labels, trademarks, copyrights or intellectual and proprietary rights on FanEx, by such User or through the User's commissions or omissions.</p>
<p>
	Users hereby grant to FanEx and its affiliates, partners, licensors and associates a worldwide, irrevocable, royalty-free, non-exclusive, sub-licensable license to use, reproduce, create derivative works of, distribute, publicly perform, publicly display, transfer, transmit, and/or publish Users' Content for any of the following purposes:</p>
<ul>
	<li>
		displaying Users' Content on FanEx</li>
	<li>
		distributing Users' Content, either electronically or via other media, to other Users seeking to download or otherwise acquire it, and/or</li>
	<li>
		storing Users' Content in a remote database accessible by end users, for a charge.</li>
	<li>
		This license shall apply to the distribution and the storage of Users' Content in any form, medium, or technology.</li>
</ul>
<p>
	All names, logos, marks, labels, trademarks, copyrights or intellectual and proprietary rights on FanEx(s) belonging to any person (including User), entity or third party are recognized as proprietary to the respective owners and any claims, controversy or issues against these names, logos, marks, labels, trademarks, copyrights or intellectual and proprietary rights must be directly addressed to the respective parties under notice to FanEx.</p>
<h2>
	4. Third Party Sites, Services and Products</h2>
<p>
	FanEx may contain links to other Internet sites owned and operated by third parties. Users' use of each of those sites is subject to the conditions, if any, posted by the sites. FanEx does not exercise control over any Internet sites apart from FanEx and cannot be held responsible for any content residing in any third-party Internet site. FanEx's inclusion of third-party content or links to third-party Internet sites is not an endorsement by FanEx of such third-party Internet site.</p>
<p>
	Users' correspondence, transactions/offers or related activities with third parties, including payment providers and verification service providers, are solely between the User and that third party. Users' correspondence, transactions and usage of the services/offers of such third party shall be subject to the terms and conditions, policies and other service terms adopted/implemented by such third party, and the User shall be solely responsible for reviewing the same prior to transacting or availing of the services/offers of such third party. User agrees that FanEx will not be responsible or liable for any loss or damage of any sort incurred as a result of any such transactions/offers with third parties. Any questions, complaints, or claims related to any third-party product or service should be directed to the appropriate vendor.</p>
<p>
	FanEx contains content that is created by the Company as well as content provided by third parties. The Company does not guarantee the accuracy, integrity, quality of the content provided by third parties and such content may not relied upon by the Users in utilizing FanEx, including participating in any Contest.</p>
<h2>
	5. Privacy Policy</h2>
<p>
	All information collected from Users, such as registration and identification, is subject to FanEx's Privacy Policy which is available at <a href="https://fanex.in/privacy_policy"> https://fanex.in/privacy_policy </a>.</p>
<h2>
	6. User Conduct</h2>
<p>
	Users agree to abide by these Terms of Use and all other rules, and regulations of the Website. In the event User does not abide by these Terms of Use and all other rules, and regulations, FanEx may, at its sole and absolute discretion, take necessary remedial action, including but not limited to:</p>
<ul>
	<li>
		restricting, suspending, or terminating any User's access to all or any part of FanEx;</li>
	<li>
		deactivating or deleting a User's account and all related information and files on the account. Any amount remaining unused in the User's Game account or Winnings Account on the date of deactivation or deletion shall be transferred to the User's bank account on record with FanEx subject to a processing fee (if any) applicable on such transfers as set out herein; or</li>
	<li>
		refraining from awarding any prize(s) to such User.</li>
</ul>
<p>
	Users agree to provide true, accurate, current and complete information at the time of registration, during any requested withdrawal of winnings, and at all other times (as required by FanEx). Users further agree to update and keep updated their registration information.</p>
<p>
	A User shall not register or operate more than one User account with FanEx.</p>
<p>
	Users agree to ensure that they can receive all communication from FanEx by marking e-mails or sending SMSs from FanEx as part of their "safe senders" list. FanEx shall not be held liable if any e-mail/SMS remains unread by a User as a result of such e-mail getting delivered to the User's junk, spam folder or remaining an unread SMS message due to the User’s setting on a mobile device.</p>
<p>
	Any password issued by FanEx to a User may not be revealed to anyone else. Users may not use anyone else's password. Users are responsible for maintaining the confidentiality of their accounts and passwords. Users agree to immediately notify FanEx of any unauthorized use of their passwords or accounts or any other breach of security.</p>
<p>
	Users agree to exit/log-out of their accounts at the end of each session. FanEx shall not be responsible for any loss or damage that may result if the User fails to comply with these requirements.</p>
<p>
	Users agree not to use cheats, exploits, automation, software, bots, hacks or any unauthorised third-party software designed to modify or interfere with the FanEx experience or assist in such activity.</p>
<p>
	Users agree not to copy, modify, rent, lease, loan, sell, assign, distribute, reverse engineer, grant a security interest in, or otherwise transfer any right to the technology or software underlying FanEx.</p>
<p>
	Users agree that without the Company’s express written consent, they shall not modify or cause to be modified any files or software that are part of FanEx.</p>
<p>
	Users agree not to disrupt, overburden, or aid or assist in the disruption or overburdening of (a) any computer or server used to offer or support FanEx (each a "Server"); or (2) the enjoyment of FanEx by any other User or person.</p>
<p>
	Users agree not to institute, assist or become involved in any type of attack, including without limitation to distribution of a virus, denial of service, or other attempts to disrupt FanEx or any other person's use or enjoyment of FanEx.</p>
<p>
	Users shall not attempt to gain unauthorised access to the User accounts, Servers or networks connected to FanEx by any means other than the User interface provided by FanEx, including but not limited to, by circumventing or modifying, attempting to circumvent or modify, or encouraging or assisting any other person to circumvent or modify, any security, technology, device, or software that underlies or is part of FanEx.</p>
<p>
	Without limiting the foregoing, Users agree not to use FanEx for any of the following:</p>
<ul>
	<li>
		To engage in any obscene, offensive, indecent, racial, communal, anti-national, objectionable, defamatory or abusive action or communication;</li>
	<li>
		To harass, stalk, threaten, or otherwise violate any legal rights of other individuals;</li>
	<li>
		To publish, post, upload, e-mail, distribute, or disseminate (collectively, "Transmit") any inappropriate, profane, defamatory, infringing, obscene, indecent, or unlawful content;</li>
	<li>
		To Transmit files that contain viruses, corrupted files, or any other similar software or programs that may damage or adversely affect the operation of another person's computer, FanEx, any software, hardware, or telecommunications equipment;</li>
	<li>
		To advertise, offer or sell any goods or services for any commercial purpose on FanEx without the express written consent of FanEx;</li>
	<li>
		To download any file, recompile or disassemble or otherwise affect our products that you know or reasonably should know cannot be legally obtained in such manner;</li>
	<li>
		To falsify or delete any author attributions, legal or other proper notices or proprietary designations or labels of the origin or the source of software or other material;</li>
	<li>
		To restrict or inhibit any other user from using and enjoying any public area within our sites;</li>
	<li>
		To collect or store personal information about other Users;</li>
	<li>
		To interfere with or disrupt FanEx, servers, or networks;</li>
	<li>
		To impersonate any person or entity, including, but not limited to, a representative of FanEx, or falsely state or otherwise misrepresent User's affiliation with a person or entity;</li>
	<li>
		To forge headers or manipulate identifiers or other data in order to disguise the origin of any content transmitted through FanEx or to manipulate User's presence on FanEx;</li>
	<li>
		To take any action that imposes an unreasonably or disproportionately large load on our infrastructure;</li>
	<li>
		To engage in any illegal activities.</li>
</ul>
<p>
	You agree to use our bulletin board services, chat areas, news groups, forums, communities and/or message or communication facilities (collectively, the "Forums") only to send and receive messages and material that are proper and related to that particular Forum.</p>
<p>
	If a User chooses a username that, in FanEx's considered opinion is obscene, indecent, abusive or that might subject FanEx to public disparagement or scorn, FanEx reserves the right, without prior notice to the User, to change such username and intimate the User or delete such username and posts from FanEx, deny such User access to FanEx, or any combination of these options.</p>
<p>
	Unauthorized access to FanEx is a breach of these Terms of Use, and a violation of the law. Users agree not to access FanEx by any means other than through the interface that is provided by FanEx for use in accessing FanEx. Users agree not to use any automated means, including, without limitation, agents, robots, scripts, or spiders, to access, monitor, or copy any part of our sites, except those automated means that we have approved in advance and in writing.</p>
<p>
	Use of FanEx is subject to existing laws and legal processes. Nothing contained in these Terms of Use shall limit FanEx's right to comply with governmental, court, and law-enforcement requests or requirements relating to Users' use of FanEx.</p>
<p>
	Users may reach out to FanEx through -</p>
<ul>
	<li>
		<a href="mailto:support@fanex.in">support@fanex.in</a> if the user has any concerns with regard to a match and/or contest within Forty Eight (48) hours of winner declaration for the concerned contest.</li>
</ul>
<p>
	Persons below the age of eighteen (18) years are not allowed to participate on any of the contests, games (by whatever name called) on FanEx. The Users will have to consent to being the age of eighteen (18) years at the time of getting access into FanEx.</p>
<p>
	The Company may not be held responsible for any content contributed by Users on FanEx.</p>
<h2>
	7. Conditions of Participation:</h2>
<p>
	By entering a Contest, user agrees to be bound by these Terms of Use and the decisions of FanEx. Subject to the terms and conditions stipulated herein below, the Company, at its sole discretion, may disqualify any user from a Contest, refuse to award benefits or prizes and require the return of any prizes, if the user engages in unfair conduct, which the Company deems to be improper, unfair or otherwise adverse to the operation of the Contest or is in any way detrimental to other Users which includes, but is not limited to:</p>
<ul>
	<li>
		Falsifying ones’ own personal information (including, but not limited to, name, email address, bank account details and/or any other information or documentation as may be requested by FanEx to enter a contest and/or claim a prize/winning.;</li>
	<li>
		Engaging in any type of financial fraud or misrepresentation including unauthorized use of credit/debit instruments, payment wallet accounts etc. to enter a Contest or claim a prize. It is expressly clarified that the onus to prove otherwise shall solely lie on the user.;</li>
	<li>
		Colluding with any other user(s) or engaging in any type of syndicate play;</li>
	<li>
		Any violation of Contest rules or the Terms of Use;</li>
	<li>
		Accumulating points or prizes through unauthorized methods such as automated bots, or other automated means;</li>
	<li>
		Using automated means (including but not limited to harvesting bots, robots, parser, spiders or screen scrapers) to obtain, collect or access any information on the Website or of any User for any purpose</li>
	<li>
		Any type of Promotions misuse, misuse of the Refer A Friend program, or misuse of any other offers;</li>
	<li>
		Tampering with the administration of a Contest or trying to in any way tamper with the computer programs or any security measure associated with a Contest;</li>
	<li>
		Obtaining other users’ information without their express consent and/or knowledge and/or spamming other users (Spamming may include but shall not be limited to send unsolicited emails to users, sending bulk emails to FanEx Users, sending unwarranted email content either to selected Users or in bulk); or</li>
	<li>
		Abusing The Fan Exchange Website in any way (‘unparliamentary language, slangs or disrespectful words’ are some of the examples of Abuse)</li>
	<li>
		It is clarified that in case a User is found to be in violation of this policy, FanEx reserves its right to initiate appropriate Civil/Criminal remedies as it may be advised other than forfeiture and/or recovery of prize money if any.</li>
</ul>
<h2>
	8. Registration for a contest</h2>
<p>
	In order to register for the Contest(s), Participants are required to accurately provide the following information:</p>
<ul>
	<li>
		Full Name</li>
	<li>
		Password</li>
	<li>
		Create a unique Username</li>
	<li>
		Mobile Number</li>
</ul>
<p>
	Participants are also required to confirm that they have read, and shall abide by, these Terms of Use as well as the FanEx <a href="https://fanex.in/privacy_policy"> https://fanex.in/privacy_policy </a> .</p>
<p>
	In the event a Participant is a resident of either Assam, Sikkim, Nagaland, Andra Pradesh, Odisha, Tamil Nadu, or Telangana, such Participant shall not proceed to sign up for any Contest with real cash prizes as described below. Furthermore, any resident of either Assam, Sikkim, Nagaland, Andra Pradesh, Odisha, Tamil Nadu, or Telangana, will be prevented from subsequently withdrawing any Contest winnings.</p>
<p>
	Once the Participants have entered the above information, by clicking on the "Accept Terms of Use" tab the Users have attested to the following:</p>
<ul>
	<li>
		Being above the age of 18 years</li>
	<li>
		Read and agree to the Company’s Terms of Use</li>
	<li>
		Read and agree to the Company’s Privacy Policy</li>
</ul>
<p>
	Once the Participants clicked on the “SIGNUP” tab, they are sent a SMS to verify their registration and login information.</p>
<h2>
	9. Contest(s), Participation and Prizes</h2>
<p>
	As part of its services, the Company may make available Contest(s) on the FanEx portal. Currently, only fantasy cricket Contests and promotional leaderboards (i.e., Chakra) are made available on FanEx. Participants are invited to create their own FanEx Contests with other Users as well. Participants choose from a list of real-life cricketers involved in the real-life cricket match, series or tournament (each a "Sport Event") to which the Contest relates. The Participant chooses the real-life cricketer the Participant predicts will have the best performance in the given statistical category (e.g., runs, wickets, etc.) in the given Sport Event.</p>
<p>
	Depending upon the circumstances of each match, the participants can edit their teams until the official match start time as declared by the officials of the Sport Event or adjusted deadline, as specified below.</p>
<p>
	FanEx reserves the right to abandon a specific round or adjust the deadline of a round in certain specific, uncertain scenarios, which are beyond FanEx’s reasonable control, including but not limited to the ones’ mentioned herein below:</p>
<h2>
	Actual match start time is before the official deadline:</h2>
<p>
	FanEx reserves the right to adjust the deadline by a Maximum of 10 minutes or 3 overs bowled, whichever is less, before the official match start time.</p>
<p>
	In cases where official match time cannot be verified by FanEx through reliable and/or publicly available sources, FanEx reserves the right to adjust the deadline to such a time by which a maximum of 3 overs in the given match are bowled.</p>
<h2>
	Actual match start time is after the official deadline:</h2>
<p>
	FanEx reserves the right to extend the deadline or abandon the contest/game based on the circumstances such as delayed toss, interruption on account of weather, non-appearance of teams, technical/equipment glitches causing delays, etc.</p>
<p>
	FanEx shall endeavor to send communications through emails and/or SMS communication, about any such change as is contemplated in the aforementioned paragraphs to keep the User updated.</p>
<p>
	Teams are awarded points on the basis of the real life cricketers', (as applicable) performances at the end of a designated match, match or tournament of the Contest(s). The Participant(s) whose Team(s) have achieved the highest aggregate score(s) in the Contest(s) shall be declared winners ("Winners"). In certain pre-specified Contests, there may be more than one Winner and distribution of prizes to such Winners will be in increasing order of their Team's aggregate score at the end of the designated match(s) of the Contests.</p>
<p>
	The Contest(s) across the FanEx Services shall, in addition to the Terms of Use, rules and regulations mentioned herein, be governed by <a href="https://fanex.in/rules-score"> https://fanex.in/rules-score </a>.</p>
<p>
	Other rules and regulations (including rules and regulation in relation to any payments made to participate in the Contest(s); and all Participants agree to abide by the same.</p>
<p>
	Currently, there are paid versions of User created Contests made available on FanEx platform. Users may participate in the Contest(s) by paying the pre-designated amount as provided on the relevant Contest page. The ‘pre-designated amount’ means and includes pre-determined commission for accessing FanEx services and pre-determined participant's contribution towards prize money pool. The Participant with the lowest StatScore (see <a href="https://fanex.in/rules-score"> https://fanex.in/rules-score</a>. for further information) at the end of the pre-determined Sporting Event shall be eligible to win a pre-designated prize which is disbursed out of prize money pool, as stated on the relevant Contest(s) page.</p>
<p>
	A Participant may create different entries for participation in Contest(s) in relation to a Sport Event across FanEx. However, unless FanEx specifies otherwise in relation to any Contest ("Multi-Entry Contest"), Participants acknowledge and agree that they may enter only once in any Contest offered in relation to a Sport Event. In case of Multi-Entry Contest(s), a Participant may enter more than once. In addition, it is expressly clarified that FanEx may, from time to time, restrict the maximum number of Teams that may be created by a single User account (for each format of the contest) or which a single User account may enter in a particular Multi-Entry Contest, in each case to such number as determined by FanEx in its sole discretion.</p>
<p>
	Participant shall pay a pre-designated amount for participating in the Contest(s) being created on FanEx. In the event a Participant is a resident of either Assam, Odisha, Sikkim, Nagaland or Telangana, such Participant shall not proceed to sign up for a paid Contest and may not participate in any paid version of the Contest(s).</p>
<p>
	In Contests where Participants have entered a completed Contest and awarded prize money and/or virtual coins, all entries with the same final StatScore shall have their winnings equally divided and the amount shall be deposited in the winning account of all Participants.</p>
<p>
	The inclusion of a real-life cricketer available for selection in a Contest is not to be construed as a real life cricket’s inclusion in the final starting lineup. The list of real-life cricketers is only to provide information and assist a User in the pool of available selections in FanEx Contests. FanEx may choose to indicate a Player's inclusion in starting lineup on the basis of information/data received through feed providers, publicly available information. Users are advised to do a thorough research of their own from official sources and/or other available sources of information. FanEx, shall not take any liability if a player earlier indicated as 'Playing' does not play or start for any reason whatsoever.</p>
<p>
	Substitutes (including 'Concussion Substitutes') on the field will be awarded points for any contribution they make.{" "}</p>
<h2>
	10. Contest Formats</h2>
<p>
	Currently two formats of contest(s) are made available on FanEx (1) Public Contest where Users can participate in a Contest with other Users without any restriction on participation and (2) Private contests, where Users can invite specific Users into a Contest and restrict participation to such invited Users. By participating in any Contest, the User hereby authorizes FanEx to appoint a third party/ Trustee/Escrow Agent to manage User’s funds on User’s behalf.</p>
<h2>
	Public contest</h2>
<p>
	In the Public contest format of the Contest(s), FanEx may make available the Contest(s) comprising of 2 - 100 Participants or any other pre-designated number of Participants.</p>
<p>
	FanEx may create this format of the Contest(s) as a paid format and the Winner will be determinable at the end of the match as per rule of the contests.</p>
<p>
	The number of Participants required to make the Contest(s) operational will be pre-specified and once the number of Participants in such Contest(s) equals the pre-specified number required for that Contest(s), such Contest(s) shall be operational. In case the number of Participants is less than the pre-specified number at the time of commencement of the match, such Contest(s) will not be operational and the pre-designated amount paid by each Participant shall be returned to the account of such User without any charge or deduction.</p>
<p>
	In certain Contests across the FanEx Services, designated as "Confirmed contests", the Contest(s) shall become operational only when a minimum of two users join a Confirmed Contest. The pre-specified number of winners to be declared in such Contest(s), even if all available Participant slots (as pre-specified in relation to the Contest(s)) remain unfilled. It is clarified that notwithstanding the activation of such Contest(s), Participants can continue to join such Contest(s) till either (i) all available Participant slots of such Contest(s) are filled or (ii) the match to which the Contest (s) relates commences, whichever is earlier. In the event of shortfall in the number of participants joining the Confirmed Contest, FanEx shall continue with such contests and the short fall in the prize pool shall be borne by FanEx.</p>
<h2>
	Private contest</h2>
<p>
	In the Private contest format of the Contest(s), FanEx enables Users to create a contest ("Private contest") and invite other users, whether existing Users or otherwise, ("Invited User") to create Teams and participate in the Contest(s). Users may create a Private contest to consist of a pre-specified number of Participants, that is, consisting of either 2 -100 Participants. The User creating the Private contest shall pay the pre-designated amount for such Private contest and thereby join that Private contest and shall supply a name for the Private contest and be provided with a unique identification code ("contest Code") (which will be issued to the account of such User). The User agrees and understands that once the Private contest is created no change shall be permitted in the terms or constitution of the Private contest, except for a change in the name of the contest. The User creating the Private contest shall provide FanEx with the email address or Facebook account username of Invited Users to enable FanEx to send a message or mail inviting such Invited User to register with FanEx (if necessary) and participate in the Private contest in relation to which the invite has been issued.</p>
<p>
	In order to participate in the Private contest, an Invited User shall input the contest Code associated with the Private contest and pay the pre-designated amount for the Private contest. Once the number of Participants in a Private contest equals the number of pre-specified Participants for that Private contest, the Private contest shall be rendered operative and no other Invited Users or Users shall be permitted to participate in the Private contest. In the event that any Private contest does not contain the pre-specified number of Participants for that Private contest within 1 hour prior to the commencement of the match/Contest, the Platform will initiate an automatic refund of the amount deposited. Such refund shall be processed after the expiry of the deadline for filling of participants for such Private Contest.</p>
<p>
	It is clarified that the participation of Invited Users in any Private contest is subject to the pre-specified number of Participants for that Private contest, and FanEx shall not be liable to any person for the inability of any Invited User to participate in any Private contest due to any cause whatsoever, including without limitation due to a hardware or technical malfunction or lack of eligibility of such Invited User to participate in the Contest(s).</p>
<h2>
	11. Legality of Game of Skill</h2>
<p>
	Games of skill are legal, as they are excluded from the ambit of Indian gambling legislations including, the Public Gambling Act of 1867.The Indian Supreme Court in the cases of State of Andhra Pradesh v. K Satyanarayana (AIR 1968 SC 825) and KR Lakshmanan v. State of Tamil Nadu (AIR 1996 SC 1153) has held that a game in which success depends predominantly upon the superior knowledge, training, attention, experience and adroitness of the player shall be classified as a game of skill.</p>
<p>
	The Contest (s) described above (across the FanEx Services) are games of skill as success of Participants depends primarily on their superior knowledge of the games of cricket statistics, knowledge of players' relative form, players' performance in a particular territory, conditions and/or format (such as ODIs, test cricket and Twenty20 in the cricket fantasy game), attention and dedication towards the Contest(s) and adroitness in playing the Contest(s). The Contest(s) also requires Participants to field well-balanced sides with limited resources and make substitutions at appropriate times to gain the maximum points.</p>
<p>
	By participating in this Contest(s), each Participant acknowledges and agrees that he/she is participating in a game of skill.</p>
<h2>
	12. Eligibility</h2>
<p>
	The Contest(s) are open only to persons above the age of 18 years.</p>
<p>
	The Contest(s) are open only to persons, currently residing in India.</p>
<p>
	FanEx may, in accordance with the laws prevailing in certain Indian states, bar individuals residing in those states from participating in the Contest(s). Currently, individuals residing in the Indian states of Assam, Sikkim, Nagaland, Andra Pradesh, Odisha, Tamil Nadu, and Telangana may not participate in the paid version of the Contest as the laws of these states bar persons from participating in games of skill where participants are required to pay to enter.</p>
<p>
	Persons who wish to participate must have a valid email address.</p>
<p>
	FanEx may on receipt of information bar a person from participation and/or withdrawing winning amounts if such person is found to be one with insider knowledge of participating teams in any given contests/match, organizing boards, leagues etc.</p>
<p>
	Only those Participants who have successfully registered on the FanEx as well as registered prior to each match in accordance with the procedure outlined above shall be eligible to participate in the Contest and win prizes.</p>
<h2>
	13. Payment Terms</h2>
<p>
	In respect of any transactions entered into on the FanEx platform, including making a payment to participate in the paid versions of Contest(s), Users agree to be bound by the following payment terms:</p>
<p>
	The payment of pre-designated amount Users make to participate in the Contest(s) is inclusive of the pre-designated platform fee for access to the FanEx Services charged by FanEx and pre-determined participant’s contribution towards prize money pool.</p>
<p>
	Subject to these Terms and Conditions, all amounts collected from the User are held in a separate non-interest earning bank Accounts. The said accounts are operated by a third party appointed by FanEx in accordance with Clause 10 of these Terms and Conditions. From these bank accounts, the payouts can be made to (a) Users (towards their withdrawals), (b) FanEx (towards its Platform Fees) and to (c) Government (towards TDS on Winnings Amount). FanEx receives only its share of the platform Fees through the said Escrow Agent and has no control over the User Funds held by the Escrow Agent in a dedicated non-interest earning Escrow Account.</p>
<p>
	The FanEx reserves the right to charge a Platform Fee, which would be specified and notified by FanEx on the Contest page, being created on FanEx platform, prior to a User's joining of such Contest. The Platform Fee (inclusive of applicable tax thereon) will be debited from the User’s account balance and FanEx shall issue an invoice for such debit to the User.</p>
<p>
	The User may participate in a Contest wherein the User has to contribute a pre-specified contribution towards the Prize Money Pool of such Contest, which will be passed on to the Winner(s) of the Contest after the completion of the Contest as per the terms and conditions of such Contest. It is clarified that FanEx has no right or interest in this Prize Money Pool, and only acts as an intermediary engaged in collecting and distributing the Prize Money Pool in accordance with the Contest terms and conditions. The amount to be paid-in by the User towards the Prize Money Pool would also be debited from the User’s account balance maintained with the Trustee.</p>
<p>
	Any user availing FanEx services are provided with two categories of accounts for the processing and reconciliation of payments: (i) 'Unutilized' Account, (ii) Winnings Account. It is clarified that in no instance the transfer of any amounts in the User's accounts to any other category of account held by the user or any third party account, including a bank account held by a third party:</p>
<p>
	User's winnings in any Contest will reflect as credits to the User's Winnings Account.</p>
<p>
	User’s remitting the amount the designated payment gateway shall be credited to User’s Unutlized Account’.</p>
<p>
	Each time a User participates in any contest on FanEx platform, the pre-designated amount shall be debited in the User’s account. In debiting amounts from the User’s accounts towards the pre-designated amount of such user shall be debited from the User’s Unutilized Account and thereafter, any remaining amount of participation fee shall be debited from the User’s Winning Account.</p>
<p>
	In case there is any amount remaining to be paid by the User in relation to such User’s participation in any match(s) or Contest(s), the User will be taken to the designated payment gateway to give effect to such payment. In case any amount added by the User through such payment gateway exceeds the remaining amount of the pre-designated amount, the amount in excess shall be transferred to the User’s ‘Unutilized’ Account and will be available for use in participation in any match(s) or Contest(s) or for withdrawal in accordance with these Terms and Conditions.</p>
<p>
	Debits from the ‘Unutilized’ Account for the purpose of enabling a user’s participation in a Contest shall be made in order of the date of credit of amounts in the ‘Unutilized’ Account, and accordingly amounts credited into ‘Unutilized’ Account earlier in time shall be debited first.</p>
<p>
	A User shall be permitted to withdraw any amounts credited into such User's 'Unutilized' Account for any reason whatsoever by contacting FanEx Customer Support. All amounts credited into a User's 'Unutilized' Account must be utilised within 335 days of credit. In case any unutilised amount lies in the 'Unutilized' Account after the completion of 335 days from the date of credit of such amount, FanEx reserves the right to forfeit such unutilised amount, without liability or obligation to pay any compensation to the User.</p>
<p>
	Withdrawal of any amount standing to the User's credit in the Winnings Account may be made by way of a request to FanEx but shall occur automatically upon completion of 335 days from the date of credit of such amount in the User's Winnings Account. In either case, FanEx shall effect an online transfer to the User's bank account on record with FanEx within a commercially reasonable period of time. Such transfer will reflect as a debit to the User's Winnings Account. FanEx shall not charge any processing fee for the online transfer of such amount from the Winnings Account to the User's bank account on record with FanEx. Users are requested to note that they will be required to provide valid photo identification and address proof documents for proof of identity and address in order for FanEx to process the withdrawal request. The name mentioned on the User's photo identification document should correspond with the name provided by the User at the time of registration on FanEx, as well as the name and address existing in the records of the User's bank account as provided to FanEx. In the event that no bank account has been registered by the User against such User's account with FanEx, or the User has not verified his/her User account with FanEx, to FanEx's satisfaction and in accordance with these Terms and Conditions, FanEx shall provide such User with a notification to the User's email address as on record with FanEx at least 30 days prior to the Auto Transfer Date, and in case the User fails to register a bank account with his/her User Account and/or to verify his/her User Account by the Auto Transfer Date, FanEx shall be entitled to forfeit any amounts subject to transfer on the Auto Transfer Date. Failure to provide FanEx with a valid bank account or valid identification documents (to FanEx's satisfaction) may result in the forfeiture of any amounts subject to transfer in accordance with this clause.</p>
<p>
	Further, in order to conduct promotional activities, FanEx may gratuitously issue Bonus points (Called as Cash Bonus) to the User for the purpose of participation in any Contest(s) and no User shall be permitted to transfer or request the transfer of any amount into the Cash Bonus. The usage of any points issued shall be subject to the limitations and restrictions, including without limitation, restrictions as to time within which such points must be used, as applied by FanEx and notified to the User at the time of issue of such amount. The issue of any points to the user is subject to the sole discretion of FanEx and cannot be demanded by any User as a matter of right. The issue of any such amount by Deam11 on any day shall not entitle the user to demand the issuance of such amount at any subsequent period in time nor create an expectation of recurring issue of such amount by FanEx to such User. The bonus points/Cash Bonus granted to the user may be used by such User for the purpose of setting off against the contribution to prize pool in any Contest, in accordance with these Terms and Conditions. The bonus points shall not be withdraw-able or transferrable to any other account of the User, including the bank account of such User, or of any other User or person, other that as part of the winnings of a User in any Contest(s). In case the User terminates his/her account with FanEx or such account if terminated by FanEx, all bonus points granted to the user shall return to FanEx and the User shall not have any right or interest on such points.</p>
<p>
	All cash bonus credited in the User account shall be valid for a period of 14 days from the date of credit. The cash bonus shall lapse at the end of 14 days and the cash bonus amount shall not reflect in the User account.</p>
<p>
	Users agree that once they confirm a transaction on FanEx, they shall be bound by and make payment for that transaction.</p>
<p>
	The User acknowledges that subject to time taken for bank reconciliations and such other external dependencies that FanEx has on third parties, any transactions on FanEx Platform may take up to 24 hours to be processed. Any amount paid or transferred into the User's 'Unutilized' Account or Winnings Account may take up to 24 hours to reflect in the User's 'Unutilized' Account r Winnings Account balance. Similarly, the utilization of the bonus points or money debited from 'Unutilized' Account or Winnings Account may take up to 24 hours to reflect in the User's 'Unutilized' Account or Winnings Account balance. Users agree not to raise any complaint or claim against FanEx in respect of any delay, including any lost opportunity to join any Contest or match due to delay in crediting of transaction amount into any of the User's accounts</p>
<p>
	A transaction, once confirmed, is final and no cancellation is permissible.</p>
<p>
	FanEx may, in certain exceptional circumstances and at its sole and absolute discretion, refund the amount to the User after deducting applicable cancellation charges and taxes. At the time of the transaction, Users may also be required to take note of certain additional terms and conditions and such additional terms and conditions shall also govern the transaction. To the extent that the additional terms and conditions contain any clause that is conflicting with the present terms and conditions, the additional terms and conditions shall prevail.</p>
<h2>
	14. Tabulation of fantasy points</h2>
<p>
	FanEx may obtain the score feed and other information required for the computation and tabulation of fantasy points from third party service provider(s). In the rare event that any error in the computation or tabulation of fantasy points, selection of winners, etc., as a result of inaccuracies in or incompleteness of the feed provided by the third-party service provider comes to its attention, FanEx shall use best efforts to rectify such error prior to the distribution of prizes. However, FanEx hereby clarifies that it relies on the accuracy and completeness of such third-party score/statistic feeds and does not itself warrant or make any representations concerning the accuracy thereof and, in any event, shall take no responsibility for inaccuracies in computation and tabulation of fantasy points or the selection of winners as a result of any inaccurate or incomplete scores/statistics received from such third party service provider. Users and Participants agree not to make any claim or raise any complaint against FanEx in this respect.</p>
<h2>
	15. Selection and Verification of Winners and Conditions relating to the Prizes</h2>
<h2>
	Selection of Winners</h2>
<p>
	Winners will be decided on the basis of the scores of the Teams in a designated match (which may last anywhere between one day and an entire tournament) of the Contest(s). The Participant(s) owning the Team(s) with the lowest StatScore (StatScore – see <a href="https://fanex.in/rules-score"> https://fanex.in/rules-score </a>) in a particular match shall be declared the Winner(s). In certain pre-specified Contests, FanEx may declare more than one Winner and distribute prizes to such Winners in increasing order of their Team's StatScore at the end of the designated match of the Contest. The contemplated number of Winners and the prize due to each Winner in such Contest shall be as specified on the Contest page prior to the commencement of the Contest.</p>
<p>
	Participants creating Teams on behalf of any other Participant or person shall be disqualified.</p>
<p>
	In the event of a tie, the winning Participants shall be declared Winners and the prize shall be equally divided among such Participants.</p>
<p>
	FanEx shall not be liable to pay any prize if it is discovered that the Winner(s) have not abided by these Terms and Conditions, and other rules and regulations in relation to the use of the FanEx, Contest, "Fantasy Rules", etc.</p>
<h2>
	Contacting Winners</h2>
<p>
	Winners shall be contacted by FanEx or the third party conducting the Contest on the e-mail address provided at the time of registration. The verification process and the documents required for the collection of prize shall be detailed to the Winners at this stage. As a general practice, winners will be required to provide one of the following documents:</p>
<p>
	Photo of the User's Aadhaar card;</p>
<p>
	Photo of a Voter ID card, which includes the User’s address;</p>
<p>
	User's Drivers License.</p>
<p>
	All User’s must verify his or her Full Name, Birth Date, and state of residence.</p>
<p>
	FanEx shall not permit a Winner to withdraw his/her prize(s)/accumulated winnings unless the above-mentioned documents have been received and verified within the time-period stipulated by FanEx. The User represents and warrants that the documents provided in the course of the verification process are true copies of the original documents to which they relate.</p>
<p>
	Participants are required to provide proper and complete details at the time of initiating a deposit or withdrawal. FanEx shall not be responsible for communications errors, commissions or omissions including those of the Participants due to which the results may not be communicated to the Winner.</p>
<p>
	The list of Winners may be posted on a separate social media web-page of FanEx. The winners may also be intimated by e-mail.</p>
<p>
	In the event that a Participant has been declared a Winner on the abovementioned web-page, but has not received any communication from FanEx, such Participant may contact FanEx within the time specified on the webpage.</p>
<h2>
	Verification process</h2>
<p>
	Only those Winners who successfully complete the verification process and provide the required documents within the time limit specified by FanEx shall be permitted to withdraw/receive their accumulated winnings (or any part thereof). FanEx shall not entertain any claims or requests for extension of time for submission of documents.</p>
<p>
	FanEx shall scrutinize all documents submitted and may, at its sole and absolute discretion, disqualify any Winner from withdrawing his accumulated winnings (or any part thereof) on the following matchs:</p>
<p>
	Determination by FanEx that any document or information submitted by the Participant is incorrect, misleading, false, fabricated, incomplete or illegible; or</p>
<p>
	Participant does not fulfill the Eligibility Criteria specified in Clause 10 above; or</p>
<p>
	Any other match.</p>
<h2>
	Taxes Payable</h2>
<p>
	Taxes Payable</p>
<h2>
	Miscellaneous</h2>
<p>
	The decision of FanEx with respect to the awarding of prizes shall be final, binding and non-contestable.</p>
<p>
	Participants playing the paid formats of the Contest(s) confirm that they are not residents of any of the following Indian states - Assam, Sikkim, Nagaland, Andra Pradesh, Odisha, Tamil Nadu, or Telangana. If it is found that a Participant playing the paid formats of the Contest(s) is a resident of any of the abovementioned states, FanEx shall disqualify such Participant and forfeit any prize won by such Participant. Further FanEx may, at its sole and absolute discretion, suspend or terminate such Participant's account with FanEx. Any amount remaining unused in the User's Game Account or Winnings Account on the date of deactivation or deletion shall be reimbursed to the User by an online transfer to the User's bank account on record with FanEx, subject to the processing fee (if any) applicable on such transfers as set out herein.</p>
<p>
	If it is found that a Participant playing the paid formats of the Contest(s) is under the age of eighteen (18), FanEx shall be entitled, at its sole and absolute discretion, to disqualify such Participant and forfeit his/her prize. Further, FanEx may, at its sole and absolute discretion, suspend or terminate such Participant's account.</p>
<p>
	To the extent permitted by law, FanEx makes no representations or warranties as to the quality, suitability or merchantability of any prizes and shall not be liable in respect of the same.</p>
<p>
	FanEx may, at its sole and absolute discretion, vary or modify the prizes being offered to winners. Participants shall not raise any claim against FanEx or question its right to modify such prizes being offered, prior to closure of the Contest.</p>
<p>
	FanEx will not bear any responsibility for the transportation or packaging of prizes to the respective winners. FanEx shall not be held liable for any loss or damage caused to any prizes at the time of such transportation.</p>
<p>
	The Winners shall bear the shipping, courier or any other delivery cost in respect of the prizes.</p>
<p>
	The Winners shall bear all transaction charges levied for delivery of cash prizes.</p>
<p>
	All prizes are non-transferable and non-refundable. Prizes cannot be exchanged / redeemed for cash or kind. No cash claims can be made in lieu of prizes in kind.</p>
<h2>
	16. Publicity</h2>
<p>
	Acceptance of a prize by the Winner constitutes permission for FanEx, and its affiliates to use the Winner's name, likeness, voice and comments for advertising and promotional purposes in any media worldwide for purposes of advertising and trade without any further permissions or consents and / or additional compensation whatsoever. The Winners further undertake that they will be available for promotional purposes as planned and desired by FanEx without any charge. The exact dates remain the sole discretion of FanEx. Promotional activities may include but not be limited to press events, internal meetings and ceremonies/functions.</p>
<h2>
	17. General Conditions</h2>
<p>
	If it comes to the notice of FanEx that any governmental, statutory or regulatory compliances or approvals are required for conducting any Contest(s) or if it comes to the notice of FanEx that conduct of any such Contest(s) is prohibited, then FanEx shall withdraw and / or cancel such Contest(s) without prior notice to any Participants or winners of any Contest(s). Users agree not to make any claim in respect of such cancellation or withdrawal of the Contest or Contest it in any manner.</p>
<p>
	&nbsp;</p>
<p>
	Employees, directors, affiliates, relatives and family members of FanEx, will not be eligible to participate in any Contest(s).</p>
<p>
	&nbsp;</p>
<h2>
	18. Dispute and Dispute Resolution</h2>
<p>
	The courts of competent jurisdiction at Mumbai shall have exclusive jurisdiction to determine any and all disputes arising out of, or in connection with, the FanEx Services provided by FanEx (including the Contest(s)), the construction, validity, interpretation and enforceability of these Terms and Conditions, or the rights and obligations of the User(s) (including Participants) or FanEx, as well as the exclusive jurisdiction to grant interim or preliminary relief in case of any dispute referred to arbitration as given below. All such issues and questions shall be governed and construed in accordance with the laws of the Republic of India.</p>
<p>
	&nbsp;</p>
<p>
	In the event of any legal dispute (which may be a legal issue or question) which may arise, the party raising the dispute shall provide a written notification ("Notification") to the other party. On receipt of Notification, the parties shall first try to resolve the dispute through discussions. In the event that the parties are unable to resolve the dispute within fifteen (15) days of receipt of Notification, the dispute shall be settled by arbitration.</p>
<p>
	&nbsp;</p>
<p>
	The place of arbitration shall be Mumbai, India. All arbitration proceedings shall be conducted in English and in accordance with the provisions of the Arbitration and Conciliation Act, 1996, as amended from time to time.</p>
<p>
	&nbsp;</p>
<p>
	The arbitration award will be final and binding on the Parties, and each Party will bear its own costs of arbitration and equally share the fees of the arbitrator unless the arbitral tribunal decides otherwise. The arbitrator shall be entitled to pass interim orders and awards, including the orders for specific performance and such orders would be enforceable in competent courts. The arbitrator shall give a reasoned award.</p>
<p>
	&nbsp;</p>
<p>
	Nothing contained in these Terms and Conditions shall prevent FanEx from seeking and obtaining interim or permanent equitable or injunctive relief, or any other relief available to safeguard FanEx's interest prior to, during or following the filing of arbitration proceedings or pending the execution of a decision or award in connection with any arbitration proceedings from any court having jurisdiction to grant the same. The pursuit of equitable or injunctive relief shall not constitute a waiver on the part of FanEx to pursue any remedy for monetary damages through the arbitration described herein.</p>
<p>
	&nbsp;</p>
<h2>
	19. Release and Limitations of Liability</h2>
<p>
	To the extent permitted under law, neither FanEx nor its parent/holding company, subsidiaries, affiliates, directors, officers, professional advisors, employees shall be responsible for the deletion, the failure to store, the mis-delivery, or the untimely delivery of any information or material.</p>
<p>
	To the extent permitted under law, FanEx shall not be responsible for any harm resulting from downloading or accessing any information or material, the quality of servers, games, products, FanEx services or sites, cancellation of competition and prizes. FanEx disclaims any responsibility for, and if a User pays for access to one of FanEx's Services the User will not be entitled to a refund as a result of, any inaccessibility that is caused by FanEx's maintenance on the servers or the technology that underlies our sites, failures of FanEx's service providers (including telecommunications, hosting, and power providers), computer viruses, natural disasters or other destruction or damage of our facilities, acts of nature, war, civil disturbance, or any other cause beyond our reasonable control. In addition, FanEx does not provide any warranty as to the content on the FanEx(s). FanEx(s) content is distributed on an "as is, as available" basis.</p>
<p>
	Any material accessed, downloaded or otherwise obtained through FanEx is done at the User's discretion, competence, acceptance and risk, and the User will be solely responsible for any potential damage to User's computer system or loss of data that results from a User's download of any such material.</p>
<p>
	FanEx shall make best endeavours to ensure that the FanEx(s) is error-free and secure, however, neither FanEx nor any of its partners, licensors or associates makes any warranty that:</p>
<p>
	the FanEx(s) will meet Users' requirements,</p>
<p>
	FanEx(s) will be uninterrupted, timely, secure, or error free</p>
<p>
	the results that may be obtained from the use of FanEx(s) will be accurate or reliable; and</p>
<p>
	the quality of any products, FanEx Services, information, or other material that Users purchase or obtain through FanExcom(s) will meet Users' expectations.</p>
<p>
	In case FanEx discovers any error, including any error in the determination of Winners or in the transfer of amounts to a User's account, FanEx reserves the right (exercisable at its discretion) to rectify the error in such manner as it deems fit, including through a set-off of the erroneous payment from amounts due to the User or deduction from the User's account of the amount of erroneous payment. In case of exercise of remedies in accordance with this clause, FanEx agrees to notify the User of the error and of the exercise of the remedy(ies) to rectify the same.</p>
<p>
	To the extent permitted under law, neither FanEx nor its partners, licensors or associates shall be liable for any direct, indirect, incidental, special, or consequential damages arising out of the use of or inability to use our sites, even if we have been advised of the possibility of such damages.</p>
<p>
	Any FanEx Services, events or Contest(s) being hosted or provided, or intended to be hosted on FanEx platform and requiring specific permission or authority from any statutory authority or any state or the central government, or the board of directors shall be deemed cancelled or terminated, if such permission or authority is either not obtained or denied either before or after the availability of the relevant FanEx Services, events or Contest(s) are hosted or provided.</p>
<p>
	To the extent permitted under law, in the event of suspension or closure of any Services, events or Contests, Users (including Participants) shall not be entitled to make any demands, claims, on any nature whatsoever.</p>
<h2>
	20. Disclaimers</h2>
<p>
	To the extent permitted under law, neither FanEx nor its parent/holding company, subsidiaries, affiliates, directors, officers, professional advisors, employees shall be responsible for the deletion, the failure to store, the mis-delivery, or the untimely delivery of any information or material.</p>
<p>
	To the extent permitted under law, FanEx shall not be responsible for any harm resulting from downloading or accessing any information or material, the quality of servers, games, products, FanEx services or sites, cancellation of competition and prizes. FanEx disclaims any responsibility for, and if a User pays for access to one of FanEx's Services the User will not be entitled to a refund as a result of, any inaccessibility that is caused by FanEx's maintenance on the servers or the technology that underlies our sites, failures of FanEx's service providers (including telecommunications, hosting, and power providers), computer viruses, natural disasters or other destruction or damage of our facilities, acts of nature, war, civil disturbance, or any other cause beyond our reasonable control. In addition, FanEx does not provide any warranty as to the content on the FanEx(s). FanEx(s) content is distributed on an "as is, as available" basis.</p>
<p>
	Any material accessed, downloaded or otherwise obtained through FanEx is done at the User's discretion, competence, acceptance and risk, and the User will be solely responsible for any potential damage to User's computer system or loss of data that results from a User's download of any such material.</p>
<p>
	FanEx shall make best endeavours to ensure that the FanEx(s) is error-free and secure, however, neither FanEx nor any of its partners, licensors or associates makes any warranty that:</p>
<p>
	the FanEx(s) will meet Users' requirements,</p>
<p>
	FanEx(s) will be uninterrupted, timely, secure, or error free</p>
<p>
	the results that may be obtained from the use of FanEx(s) will be accurate or reliable; and</p>
<p>
	the quality of any products, FanEx Services, information, or other material that Users purchase or obtain through FanExcom(s) will meet Users' expectations.</p>
<p>
	In case FanEx discovers any error, including any error in the determination of Winners or in the transfer of amounts to a User's account, FanEx reserves the right (exercisable at its discretion) to rectify the error in such manner as it deems fit, including through a set-off of the erroneous payment from amounts due to the User or deduction from the User's account of the amount of erroneous payment. In case of exercise of remedies in accordance with this clause, FanEx agrees to notify the User of the error and of the exercise of the remedy(ies) to rectify the same.</p>
<p>
	To the extent permitted under law, neither FanEx nor its partners, licensors or associates shall be liable for any direct, indirect, incidental, special, or consequential damages arising out of the use of or inability to use our sites, even if we have been advised of the possibility of such damages.</p>
<p>
	Any FanEx Services, events or Contest(s) being hosted or provided, or intended to be hosted on FanEx platform and requiring specific permission or authority from any statutory authority or any state or the central government, or the board of directors shall be deemed cancelled or terminated, if such permission or authority is either not obtained or denied either before or after the availability of the relevant FanEx Services, events or Contest(s) are hosted or provided.</p>
<p>
	To the extent permitted under law, in the event of suspension or closure of any Services, events or Contests, Users (including Participants) shall not be entitled to make any demands, claims, on any nature whatsoever.</p>
<h2>
	21. Miscellaneous</h2>
<p>
	FanEx may be required under certain legislations, to notify User(s) of certain events. User(s) hereby acknowledge and consent that such notices will be effective upon FanEx posting them on the FanEx or delivering them to the User through the email address provided by the User at the time of registration. User(s) may update their email address by logging into their account on the FanEx. If they do not provide FanEx with accurate information, FanEx cannot be held liable for failure to notify the User.</p>
<p>
	FanEx shall not be liable for any delay or failure to perform resulting from causes outside its reasonable control, including but not limited to any failure to perform due to unforeseen circumstances or cause beyond FanEx's control such as acts of God, war, terrorism, riots, embargoes, acts of civil or military authorities, fire, floods, accidents, network infrastructure failures, strikes, or shortages of transportation facilities, fuel, energy, labor or materials or any cancellation of any cricket match to which a Contest relates. In such circumstances, FanEx shall also be entitled to cancel any related Contest(s) and to process an appropriate refund for all Participants.</p>
<p>
	FanEx's failure to exercise or enforce any right or provision of these Terms and Conditions shall not constitute a waiver of such right or provision.</p>
<p>
	Users agree that regardless of any statute or law to the contrary, any claim or cause of action arising out of or related to use of the FanEx or these Terms must be filed within thirty (30) days of such claim or cause of action arising or be forever barred.</p>
<p>
	These Terms and Conditions, including all terms, conditions, and policies that are incorporated herein by reference, constitute the entire agreement between the User(s) and Fan Exchange Private Limited and govern your use of the FanEx, superseding any prior agreements that any User may have with Fan Exchange Private Limited.</p>
<p>
	If any part of these Terms and Conditions is determined to be indefinite, invalid, or otherwise unenforceable, the rest of these Terms and Conditions shall continue in full force.</p>
<p>
	FanEx reserves the right to moderate, restrict or ban the use of the FanEx, specifically to any User, or generally, in accordance with FanEx's policy/policies from time to time, at its sole and absolute discretion and without any notice.</p>
<p>
	FanEx may, at its sole and absolute discretion, permanently close or temporarily suspend any FanEx Services (including any Contest(s)).</p>
<p>
	FanEx may from time to time conduct/organize, promotions/offers on the platform. Any two or more promotions cannot be clubbed together with any other promotions that are running simultaneously on the FanEx platform. Also, promotions/offers cannot be clubbed with Cash Bonus available with any user.</p>
<h2>
	22. Standard Terms and Conditions of Promotions</h2>
<p>
	These standard terms and conditions of promotions (“Standard Terms”) supplement the terms of promotions undertaken on the FanEx website and which reference these Standard Terms (each a “Promotion”):</p>
<p>
	Participation in any Promotion will be subject to a user complying with the Promotion Terms implemented by FanEx in respect of such Promotion (“Promotion Terms”) and these Standard Terms. By participating in any Promotion, the participant further consents to and agrees to adhere with the terms and conditions of the FanEx game and FanEx’s privacy policy.</p>
<p>
	The Promotions are only open to users in India. Participation in the Promotions by proxy is not permitted.</p>
<p>
	Participation in the Promotions is voluntary.</p>
<p>
	Participation in one Promotion does not guarantee that such user will be eligible to participate in another Promotion.</p>
<p>
	A user may participate in a Promotion and avail of each Promotion only through one account. An existing user of FanEx shall not register a new account or operate more than one user account with FanEx or participate in a Promotion by registering a new account.</p>
<p>
	Users intending to participate in a Promotion may be required to verify their mobile number and other account details in accordance with the Promotion Terms for such Promotion.</p>
<p>
	Persons intending to participate in a Promotion, who have listed their phone numbers on the National Do Not Call Registry (“NDNC Registry”), shall de-register themselves from the NDNC Registry till the completion of such Promotion (including the delivery of Bonus Amount (if any) or the free-entry (if any) under such Promotion). Such persons agree not to make any claim or raise any complaint whatsoever against FanEx in this respect. Please note that persons intending to participate in a Promotion who have not de-registered themselves from the NDNC Registry shall also have no right to make any claim or raise any complaints against FanEx if they do or do not receive any call or SMS with respect to their participation and all other matters pertaining to a Promotion.</p>
<p>
	The verification process may require you to submit personal information about yourself. You agree to receive communication from FanEx. Any information collected in respect of your identity and contact details as part of a Promotion or otherwise in the course of your use of the FanEx Website shall be subject to FanEx’s Privacy Policy</p>
<p>
	FanEx may, at its sole and absolute discretion, disqualify any user from a Promotion if such user engages in or it is found that such user has engaged in any illegal, unlawful or improper conduct (with regard to any of the Promotions or otherwise).</p>
<p>
	The Bonus Amount (if any) deposited into the user’s account can be used to join cash contests and contests on FanEx. However, the Bonus Amount (if any) cannot be: (i) used to join 2-member contests; or (ii) withdrawn or transferred to any other cash balance account held by you with FanEx or to any third-party account or to any bank/payment instrument account. THE BONUS AMOUNT (IF ANY) SHALL EXPIRE AND BE WITHOUT EFFECT AT THE END OF FOURTEEN DAYS FROM THE DATE OF CREDIT OF THE BONUS AMOUNT (IF ANY).</p>
<p>
	The deposit of the Bonus Amount (if applicable) or the grant of the free-entry (if any) shall be at the sole discretion of FanEx and shall be subject to the user’s compliance with these Standard Terms and the applicable Promotion Terms. FanEx may substitute or change the Bonus Amount (if any) or free-entry (if any) offered under a Promotion at any time without notice. Users may not substitute Bonus Amount (if any) or free-entry (if any) for other items or exchange for cash.</p>
<p>
	FanEx reserves the right to withhold or forfeit the benefits of a Promotion (including a free-entry or Bonus Amount due to a participant or any prizes/winnings earned by the participant by using such benefits) in the event that it determines or reasonably believes that the participating user has violated these Standard Terms, the applicable Promotion Terms or the terms and conditions of the FanEx fantasy game(s).</p>
<p>
	Mere participation in a Promotion does not entitle the participant to receive any free-entry or Bonus Amount(s) indicated as a prize under such Promotion.</p>
<p>
	The decision of FanEx will be final and binding with respect to the Promotions, and the prizes therein and no correspondence, objection, complaints, etc. will be entertained in this regard.</p>
<p>
	Each Promotion cannot be clubbed with any of other contest/offer/promotion that are running simultaneously and organised or conducted by FanEx.</p>
<p>
	FanEx reserves the right to change/modify/or withdraw any of the Promotions and/or change these Standard Terms and/or the Promotion Terms without any prior notice of the same at its sole discretion.</p>
<p>
	FanEx does not make any commitment, express or implied, to respond to any feedback, suggestion and, or, queries of the participants of the Promotions.</p>
<p>
	Notwithstanding anything contained herein, the aggregate liability of FanEx to a participating user in relation to any Promotion for any reason whatsoever shall not exceed Rs. 50.</p>
<p>
	The Promotions shall be governed by the laws of the Republic of India, and any disputes or disagreements in respect of this Promotion shall be subject to the exclusive jurisdiction of the courts of Mumbai.</p></div>""",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const FooterView(),
            ],
          ),
        ),
      ),
      floatingActionButton: ScrollControlButton(
        onTap: () {
          _scrollController.animateTo(0,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        },
        isVisible: _isVisibleForScrollView,
      ),
    );
  }
}
