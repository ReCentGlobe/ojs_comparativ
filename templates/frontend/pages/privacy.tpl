{**
 * templates/frontend/pages/privacy.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the privacy policy.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="manager.setup.privacyStatement"}

<section class="bg-primary py-8">
  <div class="container mx-auto">
    {* Display a message if no current issue exists *}
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="manager.setup.privacyStatement"}

    <h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
      Privacy Policy
    </h1>

  </div>
</section>

<section class="bg-white py-12">
  <div class="container mx-auto">
    <div>
      <div class="text-gray-700">
        {$currentContext->getLocalizedSetting('privacyStatement')}
      </div>
    </div>
  </div>
</section><!-- .page -->


{include file="frontend/components/footer.tpl"}
