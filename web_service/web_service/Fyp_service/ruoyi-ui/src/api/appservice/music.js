import request from '@/utils/request'

// 查询音频信息列表
export function listMusic(query) {
  return request({
    url: '/appservice/music/list',
    method: 'get',
    params: query
  })
}

// 查询音频信息详细
export function getMusic(musicId) {
  return request({
    url: '/appservice/music/' + musicId,
    method: 'get'
  })
}

// 新增音频信息
export function addMusic(data) {
  return request({
    url: '/appservice/music',
    method: 'post',
    data: data
  })
}

// 修改音频信息
export function updateMusic(data) {
  return request({
    url: '/appservice/music',
    method: 'put',
    data: data
  })
}

// 删除音频信息
export function delMusic(musicId) {
  return request({
    url: '/appservice/music/' + musicId,
    method: 'delete'
  })
}
