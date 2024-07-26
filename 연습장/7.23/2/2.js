$(document).ready(function() {

    // 게시글 목록
    var posts = [];
  
    // 게시글 작성 버튼 클릭 시
    $('#postSubmit').click(function() {
      var postTitle = $('#postTitle').val();
      var postContent = $('#postContent').val();
      var postImage = $('#postImage').val();
      var post = {
        title: postTitle,
        content: postContent,
        image: postImage,
        comments: []
      };
      posts.push(post);
      localStorage.setItem('posts', JSON.stringify(posts));
      $('#postModal').modal('hide');
      renderPosts();
    });
  
    // 게시글 목록 렌더링
    function renderPosts() {
      var postList = $('#postList');
      postList.empty();
      for (var i = 0; i < posts.length; i++) {
        var post = posts[i];
        var postItem = $('<div class="card mb-3"><div class="card-body"><h5 class="card-title">' + post.title + '</h5><p class="card-text">' + post.content + '</p><img src="' + post.image + '" class="card-img-top"><button class="btn btn-danger btn-sm float-right delete-post" data-index="' + i + '">삭제</button></div></div>');
        var commentList = $('<div class="comment-list"></div>');
        for (var j = 0; j < post.comments.length; j++) {
          var comment = post.comments[j];
          var commentItem = $('<div class="card mb-3"><div class="card-body"><p class="card-text">' + comment + '</p><button class="btn btn-danger btn-sm float-right delete-comment" data-post-index="' + i + '" data-comment-index="' + j + '">삭제</button></div></div>');
          commentList.append(commentItem);
        }
        var commentForm = $('<form class="comment-form"><div class="form-group"><textarea class="form-control" rows="2" placeholder="댓글을 입력하세요"></textarea></div><button type="submit" class="btn btn-primary btn-sm float-right">작성</button></form>');
        commentForm.submit(function(e) {
          e.preventDefault();
          var commentText = $(this).find('textarea').val();
          var postIndex = $(this).closest('.card').find('.delete-post').data('index');
          posts[postIndex].comments.push(commentText);
          localStorage.setItem('posts', JSON.stringify(posts));
          renderPosts();
        });
        postItem.append(commentList);
        postItem.append(commentForm);
        postList.append(postItem);
      }
      $('.delete-post').click(function() {
        var postIndex = $(this).data('index');
        posts.splice(postIndex, 1);
        localStorage.setItem('posts', JSON.stringify(posts));
        renderPosts();
      });
      $('.delete-comment').click(function() {
        var postIndex = $(this).data('post-index');
        var commentIndex = $(this).data('comment-index');
        posts[postIndex].comments.splice(commentIndex, 1);
        localStorage.setItem('posts', JSON.stringify(posts));
        renderPosts();
      });
    }
  
    // 게시글 목록 초기화
    function initPosts() {
      var savedPosts = localStorage.getItem('posts');
      if (savedPosts) {
        posts = JSON.parse(savedPosts);
      }
      renderPosts();
    }
  
    initPosts();
  
  });
