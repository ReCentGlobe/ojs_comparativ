{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}



</div><!-- pkp_structure_content -->

<footer id="pkp_content_footer" class="uk-section-primary uk-section" role="contentinfo">

	<div class="uk-container">
		<div class="uk-grid-large uk-grid-margin-large uk-grid-small" uk-grid>
			<div class="uk-width-expand@m uk-width-1-2@s">
				<h3 class="uk-h5 uk-text-uppercase" uk-scrollspy="cls:uk-animation-fade">About Us</h3>
				{load_menu name="footer" id="" ulClass="uk-list" liClass="uk-link-muted"}
			</div>
			<div class="uk-width-expand@m uk-width-1-2@s">
				<h3 class="uk-h5 uk-text-uppercase" uk-scrollspy="cls:uk-animation-fade">Sections</h3>
				{load_menu name="footer2" id="" ulClass="uk-list" liClass="uk-link-muted"}
			</div>
			<div class="uk-width-expand@m uk-width-1-2@s">
				<h3 class="uk-h5 uk-text-uppercase" uk-scrollspy="cls:uk-animation-fade">Subscriptions</h3>
				{load_menu name="footer3" id="" ulClass="uk-list" liClass="uk-link-muted"}
			</div>
			<div class="uk-width-expand@m uk-width-1-2@s" role="complementary">
				<h3 class="uk-h5 uk-text-uppercase " uk-scrollspy="cls:uk-animation-fade">Legal Notices</h3>
				<div class="uk-margin uk-width-xlarge uk-text-muted uk-link-reset" uk-scrollspy="cls:uk-animation-fade">
					{$pageFooter}
				</div>
				{load_menu name="footer4" id="" ulClass="uk-list" liClass="uk-link-muted"}
			</div>
		</div>
	</div>
</footer><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
