<!-- Recent Cards plugin -->
<ul class="categories">
	<p>Recent Topics</p>
</ul>

<div class="row recent-cards" itemscope itemtype="http://www.schema.org/ItemList">
	<!-- BEGIN categories -->
	<div component="categories/category" class="<!-- IF categories.class -->{categories.class}<!-- ELSE -->col-md-3 col-sm-6 col-xs-12<!-- ENDIF categories.class --> category-item" data-cid="{categories.cid}" data-numRecentReplies="{categories.numRecentReplies}">
		<meta itemprop="name" content="{categories.name}">

		<div class="category-icon">

			<!-- IF categories.link -->
			<a style="color: {categories.color};" href="{categories.link}" itemprop="url" target="_blank">
			<!-- ELSE -->
			<a style="color: {categories.color};" href="{config.relative_path}/category/{categories.slug}" itemprop="url">
			<!-- ENDIF categories.link -->
				<div
					id="category-{categories.cid}" class="category-header category-header-image-{categories.imageClass}"
					style="
						<!-- IF categories.backgroundImage -->background-image: url({categories.backgroundImage});<!-- ENDIF categories.backgroundImage -->
						<!-- IF categories.bgColor -->background-color: {categories.bgColor};<!-- ENDIF categories.bgColor -->
						color: {categories.color};
					"
				>
					<!-- IF categories.icon -->
					<div><i class="fa {categories.icon} fa-4x"></i></div>
					<!-- ENDIF categories.icon -->
				</div>
			</a>

			<div class="category-box">
				<div class="category-info" style="color: {categories.color};">
					<!-- IF categories.link -->
					<a href="{categories.link}" itemprop="url" target="_blank" style="color: {categories.color};">
					<!-- ELSE -->
					<a href="{config.relative_path}/category/{categories.slug}" itemprop="url" style="color: {categories.color};">
					<!-- ENDIF categories.link-->
						<h4><!-- IF categories.icon --><i class="fa {categories.icon} visible-xs-inline"></i> <!-- ENDIF categories.icon -->{categories.name}</h4>
						<div class="description" itemprop="description">{categories.description}</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- END categories -->
</div>
<br />