{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the press's contact details.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $mailingAddress string Mailing address for the journal/press
 * @uses $contactName string Primary contact name
 * @uses $contactTitle string Primary contact title
 * @uses $contactAffiliation string Primary contact affiliation
 * @uses $contactPhone string Primary contact phone number
 * @uses $contactEmail string Primary contact email address
 * @uses $supportName string Support contact name
 * @uses $supportPhone string Support contact phone number
 * @uses $supportEmail string Support contact email address
 *}
{include file="frontend/components/header.tpl" pageTitle="about.contact"}

<section class="bg-primary py-8">
	<div class="container mx-auto animate-fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.contact"}
		<h1 class="text-2xl font-bold text-white mt-0">Contact</h1>
	</div>
</section>

<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="grid md:grid-cols-3 gap-8">
			<div class="md:col-span-3 mb-4">
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="contact" sectionTitleKey="about.contact"}
			</div>

			{if $mailingAddress}
				<div class="contact-address">
					<h3 class="text-lg font-bold mb-2">Editorial Office</h3>
					<p class="text-gray-700">{$mailingAddress|nl2br|strip_unsafe_html}</p>
				</div>
			{/if}

			{* Primary contact *}
			{if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
				<div class="contact">
					<h3 class="text-lg font-bold mb-2">{translate key="about.contact.principalContact"}</h3>
					{if $contactName}
						<div class="name font-semibold">{$contactTitle|escape} {$contactName|escape}</div>
					{/if}
					{if $contactAffiliation}
						<div class="affiliation text-sm text-gray-700">{$contactAffiliation|strip_unsafe_html}</div>
					{/if}
					{if $contactPhone}
						<div class="phone flex items-center gap-2">
							<span class="label font-medium">{translate key="about.contact.phone"}</span>
							<span class="value">{$contactPhone|escape}</span>
						</div>
					{/if}
					{if $contactEmail}
						<div class="email">
							<a href="mailto:{$contactEmail|escape}" class="text-primary hover:underline">{$contactEmail|escape}</a>
						</div>
					{/if}
				</div>
			{/if}

			{* Technical contact *}
			{if $supportName || $supportPhone || $supportEmail}
				<div class="contact">
					<h3 class="text-lg font-bold mb-2">{translate key="about.contact.supportContact"}</h3>
					{if $supportName}
						<div class="name font-semibold">{$supportName|escape}</div>
					{/if}
					{if $supportPhone}
						<div class="phone flex items-center gap-2">
							<span class="label font-medium">{translate key="about.contact.phone"}</span>
							<span class="value">{$supportPhone|escape}</span>
						</div>
					{/if}
					{if $supportEmail}
						<div class="email">
							<a href="mailto:{$supportEmail|escape}" class="text-primary hover:underline">{$supportEmail|escape}</a>
						</div>
					{/if}
				</div>
			{/if}
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
