<!-- IF list.length -->
<div class="limiter nodebb-widget-vite-nodes">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">
						<div class="row header">
							<div class="cell">
								Number
							</div>
							<div class="cell">
								IP
							</div>
							<div class="cell">
								Status
							</div>
							<div class="cell">
								OS
							</div>
							<div class="cell">
								Version
							</div>
							<div class="cell">
								Height
							</div>
							<div class="cell">
								Location
							</div>
						</div>
                        <!-- BEGIN list -->
                        						<div class="row">
                        							<div class="cell" data-title="Number">
                        								{list.number}
                        							</div>
                        							<div class="cell" data-title="IP">
                        								{list.ip}
                        							</div>
                        							<div class="cell" data-title="Status">
                        								{list.status}
                        							</div>
                        							<div class="cell" data-title="OS">
                        								{list.os}
                        							</div>
                        							<div class="cell" data-title="Version">
                        								{list.processInfo.build_version}
                        							</div>
                        							<div class="cell" data-title="Height">
                        								{list.snapshot.Height}
                        							</div>
                        							<div class="cell" data-title="Location">
                        								{list.location}
                        							</div>
                        						</div>
                        <!-- END list -->

					</div>
			</div>
		</div>
</div>
<!-- ENDIF list.length -->


