{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $submissionChecklist array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

<section class="bg-primary py-8">
	<div class="container mx-auto animate-fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.submissions"}
		<h1 class="text-2xl font-bold text-white mt-0">Submissions</h1>
	</div>
</section>

<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="grid">
			<div class="col-span-1">
				<div class="content text-gray-700">
					<p>
						Comparativ publishes thematic issues and single articles with a specific focus on border-crossing flows of people, goods, capital, ideas, and other cultural patterns as well as viruses, pollution, and effects of climate change. We give preference to manuscripts that address not only the qualitative or quantitative measurement of such flows but also take into consideration the changing attempts to control these flows. This revision may take the form of new institutions, spatial formats, social habits, or ideologies, to mention but a few. We also welcome contributions with theoretical and methodological considerations as well as papers on the role of transnationalism and transregionalism in any societal dimension. The rigorous peer-review process by an international body of reviewers guarantees the high quality of each issue.
					</p>
					<p>
						Each Comparativ issue consists of up to four sections. The article section is edited by the editor(s) in charge of the respective thematic issue. The forum section includes single articles not devoted to the main theme of the thematic issue. Reviews about new scientific publications in the general thematic areas of Comparativ are published in the review section, which is followed by the annotation section that announces books of general interest. We welcome suggestions for books to be reviewed. If you would like to review books for our journal, please contact us by email.
					</p>

					<h2 class="text-lg font-bold mt-8 mb-2">Submit a single article</h2>
					<p>
						Comparativ looks for articles of the highest quality for the forum section. We accept only texts that are not yet published or under review for publication elsewhere. Articles are accepted in English, French, and German and have to be accompanied by an abstract of 100 –150 words in English or German. In general, the article should not exceed a length of 8,000 words (including footnotes). As we understand that there are exceptional cases where such limitations are not appropriate, before submitting an article that goes beyond the standard length, please contact the editorial office.
					</p>
					<p>
						All articles are published under the open access policy of the journal. All issues of Comparativ are fully available to its subscribers and after 36 months, issues and articles become open access to all readers. Authors are allowed to post the published version on their personal/departmental website as well as place it in their institution’s official repository by connecting to the journal’s website and indicating the original place of publication.
					</p>
					<p>
						Before submitting an article, please have a look at the <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" target="_blank" href="https://www.comparativ.net/public/downloads/comparativ_english_styleguide.pdf">guidelines</a>
					</p>
					<p>
						Article Submissions are considered all time of the year, and the review process is organized accordingly.
					</p>

					{if $isUserLoggedIn}
						{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}" class="text-primary hover:underline">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
						<div class="cmp_notification mt-4">
							<a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url page="submission" op="wizard"}">Submit your article here</a>
						</div>
					{else}
						{capture assign="login"}<a href="{url page="login"}" class="text-primary hover:underline">{translate key="about.onlineSubmissions.login"}</a>{/capture}
						{capture assign="register"}<a href="{url page="user" op="register"}" class="text-primary hover:underline">{translate key="about.onlineSubmissions.register"}</a>{/capture}
						<div class="cmp_notification mt-4">
							{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
						</div>
					{/if}

					<p>
						Or send your submission to the journal’s editorial office by mail: <a class="text-accent hover:underline" target="_blank" href="mailto:comparativ@uni-leipzig.de">comparativ@uni-leipzig.de</a>. Please provide your manuscript as a Word document (and do not submit a PDF).
					</p>

					<h2 class="text-lg font-bold mt-8 mb-2">Submit a proposal for a full thematic issue</h2>
					<p>
						Comparativ publishes six thematic issues a year, with an overall length of 40.000 words for each issue; additionally, the journal also considers from time to time proposals for double issues, with a maximum of eight contributions and a substantial introduction.
					</p>
					<p>
						The review process is organized into two steps. In the first step, the innovative character and the coherence of a proposal for a full thematic issue is evaluated. Proposals have to be submitted by 30th September of each year at the latest to be discussed at the annual editorial conference and to be considered for the following year. Proposals should not exceed 2,000 words and need to contain both a description of the overall aims of the issue and of the individual papers with the names of the planned authors. The second step of peer review applies to the manuscripts submitted and targets the individual quality of the articles as well as their original contribution to the overall aims of the thematic issue as outlined in the introduction by the guest editors of the issue.
					</p>
					<p>
						All articles are published under the open access policy of the journal. All issues of Comparativ are fully available to its subscribers and after 36 months, issues and articles become open access to all readers. Authors are allowed to post the published version on their personal/departmental website as well as place it in their institution’s official repository by connecting to the journal’s website and indicating the original place of publication.
					</p>

					{if $isUserLoggedIn}
						{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}" class="text-primary hover:underline">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
						<div class="cmp_notification mt-4">
							<a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url page="submission" op="wizard"}">Submit your proposal for a full thematic issue now.</a>
						</div>
					{else}
						{capture assign="login"}<a href="{url page="login"}" class="text-primary hover:underline">{translate key="about.onlineSubmissions.login"}</a>{/capture}
						{capture assign="register"}<a href="{url page="user" op="register"}" class="text-primary hover:underline">{translate key="about.onlineSubmissions.register"}</a>{/capture}
						<div class="cmp_notification mt-4">
							{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
						</div>
					{/if}

					<p>
						Or send your submission to the journal’s editorial office by mail: <a class="text-accent hover:underline" target="_blank" href="mailto:comparativ@uni-leipzig.de">comparativ@uni-leipzig.de</a>. Please provide your manuscript as a Word document (and do not submit a PDF).
					</p>

					<h2 class="text-lg font-bold mt-8 mb-2">Submit a book review</h2>
					<p>
						Comparativ, itself being a product of the ongoing transnationalization in the humanities and social sciences, aims at facilitating scholarly dialogue across the boundaries of national academic cultures, linguistic areas, and disciplinary definitions of subject matters. It therefore focuses on reviewing forthcoming or recent publications that contribute in an innovative way to the development of transnational, transregional, and global history as well as to the study of globalization projects across world regions. We welcome suggestions for such reviews from both publishers and scholars. Reviews of individual publications should be no longer than 1,500 words; reviews of a set of publications that provide an overview of recent trends in a particular subfield of Comparativ’s general subject should not exceed the length of 4,000 words. Publishers will receive a copy of the review article once it has been published. Please note that we will not return unrequested review copies.
					</p>
					<p>
						Suggestions for reviews are considered throughout the year, please email us: comparativ@uni-leipzig.de
					</p>
					<p>
						<a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" target="_blank" href="https://www.comparativ.net/public/downloads/comparativ_english_styleguide_reviews.pdf">Styleguide (PDF) (Style Guide for reviews)</a>
					</p>

				</div>

				{if $currentContext->getLocalizedSetting('copyrightNotice')}
					<div class="copyright_notice content mt-8">
						<h2 class="text-lg font-bold mb-2">
							{translate key="about.copyrightNotice"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="distribution" anchor="permissions" sectionTitleKey="about.copyrightNotice"}
						</h2>
						{$currentContext->getLocalizedSetting('copyrightNotice')|nl2br}
					</div>
				{/if}
			</div>
		</div>
	</div>

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
