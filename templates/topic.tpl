<div class="topic">
	<!-- IMPORT partials/breadcrumbs.tpl -->

	<div component="topic/deleted/message" class="alert alert-warning<!-- IF !deleted --> hidden<!-- ENDIF !deleted -->">[[topic:deleted_message]]</div>

	<ul component="topic" id="post-container" class="posts" data-tid="{tid}">
		<!-- BEGIN posts -->
			<li component="post" class="post-row <!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
				<a component="post/anchor" name="{posts.index}"></a>

				<meta itemprop="datePublished" content="{posts.relativeTime}">
				<meta itemprop="dateModified" content="{posts.relativeEditTime}">

				<div class="topic-item">
					<div class="topic-body">
						<div class="row">
							<div class="col-md-12">
								<div class="topic-profile-pic hidden-xs text-center">
									<a href="<!-- IF posts.user.userslug -->{relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
										<img src="{posts.user.picture}" alt="{posts.user.username}" class="profile-image user-img" title="{posts.user.username}">
									</a>
									<small class="username" title="{posts.user.username}"><a href="<!-- IF posts.user.userslug -->{relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">{posts.user.username}</a></small>

									<!-- IF posts.user.banned -->
									<div class="text-center">
										<span class="label label-danger">[[user:banned]]</span>
									</div>
									<!-- ENDIF posts.user.banned -->

									<!-- IMPORT partials/topic/badge.tpl -->
								</div>
								<div class="topic-text">
									<!-- IF @first -->
									<h3 class="topic-title">
										<p component="post/header" class="topic-title" itemprop="name"><i class="fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->"></i> <i class="fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->"></i> <span component="topic/title">{title}</span></p>
										<hr>
									</h3>
									<!-- ENDIF @first -->
									<div component="post/content" class="post-content" itemprop="text">{posts.content}</div>
									<!-- IF posts.user.signature -->
									<div class="post-signature">{posts.user.signature}</div>
									<!-- ENDIF posts.user.signature -->
								</div>
							</div>
						</div>
					</div>
					<div class="topic-footer">
						<div class="row">
							<div class="">
								<small class="pull-right">
									<span>
										<!-- IF posts.user.userslug -->
										<i component="user/status" class="fa fa-circle status {posts.user.status}" title='[[global:{posts.user.status}]]'></i>
										<!-- ENDIF posts.user.userslug -->
										<span data-username="{posts.user.username}" data-uid="{posts.user.uid}">
											<!-- IF posts.user.userslug -->
											[[global:user_posted_ago, <strong><a href="{relative_path}/user/{posts.user.userslug}" itemprop="author">{posts.user.username}</a></strong>, <span class="timeago" title="{posts.relativeTime}"></span>]]
											<!-- ELSE -->
											[[global:guest_posted_ago, <span class="timeago" title="{posts.relativeTime}"></span>]]
											<!-- ENDIF posts.user.userslug -->
										</span>
									</span>


									<span component="post/editor" class="<!-- IF !posts.editor.username --> hidden<!-- ENDIF !posts.editor.username -->">, [[global:last_edited_by_ago, <strong><a href="{relative_path}/user/{posts.editor.userslug}">{posts.editor.username}</a></strong>, <span class="timeago" title="{posts.relativeEditTime}"></span>]]</span>

								</small>

								<div class="dropdown moderator-tools" component="post/tools">
									<a href="#" data-toggle="dropdown"><i class="fa fa-fw fa-gear"></i></a>
									<ul class="dropdown-menu" role="menu">
										<!-- IMPORT partials/topic/post-menu.tpl -->
									</ul>
								</div>

								<!-- IF !reputation:disabled -->
								&bull;
								<a component="post/upvote" href="#" class="upvote<!-- IF posts.upvoted --> upvoted<!-- ENDIF posts.upvoted -->">
									<i class="fa fa-chevron-up"></i>
								</a>
								<span component="post/vote-count" class="votes" data-votes="{posts.votes}">{posts.votes}</span>
								<!-- IF !downvote:disabled -->
								<a component="post/downvote" href="#" class="downvote<!-- IF posts.downvoted --> downvoted<!-- ENDIF posts.downvoted -->">
									<i class="fa fa-chevron-down"></i>
								</a>
								<!-- ENDIF !downvote:disabled -->
								<!-- ENDIF !reputation:disabled -->

								<!-- IF posts.user.custom_profile_info.length -->
									<!-- BEGIN custom_profile_info -->
									&bull; {posts.user.custom_profile_info.content}
									<!-- END custom_profile_info -->
								<!-- ENDIF posts.user.custom_profile_info.length -->
								<span class="post-tools">
									<!-- IF !posts.selfPost -->
									<!-- IF posts.user.userslug -->
									<!-- IF loggedIn -->
									<!-- IF !config.disableChat -->
									<button component="post/chat" class="btn btn-sm btn-link chat" type="button" title="[[topic:chat]]"><i class="fa fa-comment"></i><span class="hidden-xs-inline"> [[topic:chat]]</span></button>
									<!-- ENDIF !config.disableChat -->
									<!-- ENDIF loggedIn -->
									<!-- ENDIF posts.user.userslug -->
									<!-- ENDIF !posts.selfPost -->

									<button component="post/quote" class="btn btn-sm btn-link <!-- IF !privileges.topics:reply -->hidden<!--ENDIF !privileges.topics:reply -->" type="button" title="[[topic:quote]]"><i class="fa fa-quote-left"></i><span class="hidden-xs-inline"> [[topic:quote]]</span></button>
									<button component="post/reply" class="btn btn-sm btn-link <!-- IF !privileges.topics:reply -->hidden<!--ENDIF !privileges.topics:reply -->" type="button"><i class="fa fa-reply"></i><span class="hidden-xs-inline"> [[topic:reply]]</span></button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</li>

			<!-- IF !posts.index -->
			<div class="post-bar" data-index="{posts.index}">
				<!-- IMPORT partials/post_bar.tpl -->
			</div>
			<!-- ENDIF !posts.index -->
		<!-- END posts -->
	</ul>

	<div class="post-bar col-xs-12 <!-- IF unreplied -->hidden<!-- ENDIF unreplied --> bottom-post-bar">
		<!-- IMPORT partials/post_bar.tpl -->
	</div>

	<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
	<!-- ENDIF config.usePagination -->

	<!-- IMPORT partials/move_thread_modal.tpl -->
	<!-- IMPORT partials/fork_thread_modal.tpl -->
	<!-- IMPORT partials/move_post_modal.tpl -->
</div>

<!-- IMPORT partials/noscript/paginator.tpl -->
<!-- IMPORT partials/variables/topic.tpl -->