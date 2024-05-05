import request from '@/utils/request'

// 查询app使用记录列表
export function listHistory(query) {
  return request({
    url: '/appservice/history/list',
    method: 'get',
    params: query
  })
}

// 查询app使用记录详细
export function getHistory(historyId) {
  return request({
    url: '/appservice/history/' + historyId,
    method: 'get'
  })
}

// 新增app使用记录
export function addHistory(data) {
  return request({
    url: '/appservice/history',
    method: 'post',
    data: data
  })
}

// 修改app使用记录
export function updateHistory(data) {
  return request({
    url: '/appservice/history',
    method: 'put',
    data: data
  })
}

// 删除app使用记录
export function delHistory(historyId) {
  return request({
    url: '/appservice/history/' + historyId,
    method: 'delete'
  })
}
